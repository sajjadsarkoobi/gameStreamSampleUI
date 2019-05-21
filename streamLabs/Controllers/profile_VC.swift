//
//  profile_VC.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import UIKit

class profile_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = AppColors.mainAppColor
    }
   

}


//Set the status bar color to white
extension profile_VC {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
