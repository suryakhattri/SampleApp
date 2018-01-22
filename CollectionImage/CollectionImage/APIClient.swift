//
//  APIClient.swift
//  CollectionImage
//
//  Created by Rajan Khattri on 1/10/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import Foundation

typealias AudiobookJSON = [String: Any]

struct APIClient {
    
    static func getAudiobooksAPI(completion: @escaping (AudiobookJSON?) -> Void) {
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/audiobooks/top-audiobooks/all/30/explicit.json")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? AudiobookJSON
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
