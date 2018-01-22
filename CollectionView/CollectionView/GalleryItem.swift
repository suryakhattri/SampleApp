//
//  GalleryItem.swift
//  CollectionView
//
//  Created by Rajan Khattri on 1/11/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import Foundation

class GalleryItem {
    
    var itemImage: String
    
    init(dataDictionary:Dictionary<String,String>) {
        itemImage = dataDictionary["itemImage"]!
    }
    
    class func newGalleryItem(_ dataDictionary:Dictionary<String,String>) -> GalleryItem {
        return GalleryItem(dataDictionary: dataDictionary)
    }

}
