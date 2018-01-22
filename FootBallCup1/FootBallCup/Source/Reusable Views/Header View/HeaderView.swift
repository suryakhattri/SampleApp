//
//  HeaderView.swift
//  FootBallCup
//
//  Created by Rajan Khattri on 1/18/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {

    final class HeaderView: UICollectionReusableView {
        
        // MARK: - IBOutlet
        @IBOutlet weak var overlayView: UIView!
        
        
        
        // MARK: - Life Cycle
        open override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
            super.apply(layoutAttributes)
            
            guard let customFlowLayoutAttributes = layoutAttributes as? CustomLayoutAttributes else {
                return
            }
            
            overlayView?.alpha = customFlowLayoutAttributes.headerOverlayAlpha
        }
}
}
