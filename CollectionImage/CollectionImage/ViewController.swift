//
//  ViewController.swift
//  CollectionImage
//
//  Created by Rajan Khattri on 1/10/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

//protocol UICollectionViewDataSource: NSObjectProtocol {
//}



class ViewController: UIViewController, UICollectionViewDataSource {


    @IBOutlet var collectionView: UICollectionView!
    let store = DataStore.sharedInstance
    
//    let identifier = "CellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.getBookImages {
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
//        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.audiobooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
       let book = store.audiobooks[indexPath.row]

        cell.displayContent(image: store.images[indexPath.row], title: book.name)
        return cell
    }
}



