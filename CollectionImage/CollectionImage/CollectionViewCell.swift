//
//  CollectionViewCell.swift
//  CollectionImage
//
//  Created by Rajan Khattri on 1/10/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bookImage: UIImageView!
    @IBOutlet var bookLabel: UILabel!
    
    func displayContent(image: UIImage, title: String) {
        
        bookImage.image = image
        bookLabel.text = title
        
    }
}
