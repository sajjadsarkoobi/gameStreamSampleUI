//
//  uiTabBarExtention.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation
import UIKit

//Make uitabbar height smaller
extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = IsiPhoneX ? 75 : 45
        return sizeThatFits
    }
}
