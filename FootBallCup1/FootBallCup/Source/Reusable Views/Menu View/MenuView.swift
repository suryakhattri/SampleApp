//
//  MenuView.swift
//  FootBallCup
//
//  Created by Rajan Khattri on 1/18/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

protocol MenuViewDelegate {
    func reloadCollectionViewDataWithTeamIndex(_ index: Int)
}


class MenuView: UICollectionReusableView {

    //MARK: - Porpoties
    
//    let myCellNib = UINib(nibName: "PlayerCell”, bundle: nil)
//    collectionView.register(myCellNib, forCellWithReuseIdentifier: CellIdentifier)
  
    var delegate: MenuViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        delegate = nil
    }
    
    
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        xibSetup()
//        contentView?.prepareForInterfaceBuilder()
//    }
    
}


    // MARK: - IBActions
    extension MenuView {
        
        @IBAction func tappedButton(_ sender: UIButton) {
            delegate?.reloadCollectionViewDataWithTeamIndex(sender.tag)
        }
    }

