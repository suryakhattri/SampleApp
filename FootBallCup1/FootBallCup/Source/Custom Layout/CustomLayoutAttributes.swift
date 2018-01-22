//
//  CustomLayoutAttributes.swift
//  FootBallCup
//
//  Created by Rajan Khattri on 1/17/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

class CustomLayoutAttributes: UICollectionViewLayoutAttributes {
    
    // MARK: - Properties
    var parallax: CGAffineTransform = .identity
    var initialOrigin: CGPoint = .zero
    var headerOverlayAlpha = CGFloat(0)
    
    // MARK: - Life Cycle
    override func copy(with zone: NSZone?) -> Any {
        guard let copiedAttributes = super.copy(with: zone) as? CustomLayoutAttributes else {
            return super.copy(with: zone)
        }
        
        copiedAttributes.parallax = parallax
        copiedAttributes.initialOrigin = initialOrigin
        copiedAttributes.headerOverlayAlpha = headerOverlayAlpha
        return copiedAttributes
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let otherAttributes = object as? CustomLayoutAttributes else {
            return false
        }
        
        if NSValue(cgAffineTransform: otherAttributes.parallax) != NSValue(cgAffineTransform: parallax)
            || otherAttributes.initialOrigin != initialOrigin
            || otherAttributes.headerOverlayAlpha != headerOverlayAlpha {
            return false
        }
        
        return super.isEqual(object)
    }
}

