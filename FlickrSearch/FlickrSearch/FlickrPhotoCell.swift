//
//  FlickrPhotoCell.swift
//  FlickrSearch
//
//  Created by Rajan Khattri on 1/15/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

class FlickrPhotoCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!


// MARK: - Properties
    
override var isSelected: Bool {
    didSet {
        imageView.layer.borderWidth = isSelected ? 5 : 0
    }
}

//  MARK: - View Life Cycle
    
override func awakeFromNib() {
    super.awakeFromNib()
    imageView.layer.borderColor = themeColor.cgColor
    isSelected = false
}

}
