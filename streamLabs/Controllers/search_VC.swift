//
//  search_VC.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import UIKit

class search_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = AppColors.mainAppColor
    }
}

//Set the status bar color to white
extension search_VC {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
