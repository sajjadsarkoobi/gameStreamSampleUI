//
//  uiViewExtention.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/15/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //Round a view
    func round(radius:CGFloat = 0){
        self.layer.cornerRadius = (radius == 0 ? (self.frame.height/2) : radius)
    }
    
    
}
