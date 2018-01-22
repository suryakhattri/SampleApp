//
//  HomeViewController.swift
//  IosApp
//
//  Created by Rajan Khattri on 12/28/17.
//  Copyright © 2017 suryakhattri. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
         let dict = ["Key": "Name", "Key1": "Name1"]
        var keys = Array(dict.keys)
        self.lblfirstName.text = keys[1]

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
