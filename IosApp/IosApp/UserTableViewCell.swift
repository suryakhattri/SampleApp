//
//  UserTableViewCell.swift
//  IosApp
//
//  Created by Rajan Khattri on 12/28/17.
//  Copyright © 2017 suryakhattri. All rights reserved.
//


import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var lblFirstname: UILabel!
    @IBOutlet var lblLastName: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
