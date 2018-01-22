//
//  GalleryItemCollectionViewCell.swift
//  CollectionView
//
//  Created by Rajan Khattri on 1/11/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

class GalleryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var itemImageView: UIImageView!
 
    
    func setGalleryItem(_ item:GalleryItem) {
        itemImageView.image = UIImage(named: item.itemImage)
    }
    
}
