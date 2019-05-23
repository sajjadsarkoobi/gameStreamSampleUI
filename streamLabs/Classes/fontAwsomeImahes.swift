//
//  fontAwsomeImahes.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation
import UIKit


///images from fontawsome
struct fontImages {
    
    static var tabbarIconSize : CGSize { return  CGSize(width: 30, height: 30) }
    static var smallIconSize : CGSize { return  CGSize(width: 15, height: 15) }
    ///Tab Bar Icons
    
    //First Icon
    static var tabBar0Icon : UIImage { return UIImage.fontAwesomeIcon(name: .youtubeSquare, style: .brands, textColor: AppColors.grayColor, size: tabbarIconSize)}
    static var tabBar0SelectedIcon : UIImage { return UIImage.fontAwesomeIcon(name: .youtubeSquare, style: .brands, textColor: .white, size: tabbarIconSize)}
    
    //Second Icon
    static var tabBar1Icon : UIImage { return UIImage.fontAwesomeIcon(name: .search, style: .solid, textColor: AppColors.grayColor, size: tabbarIconSize)}
    static var tabBar1SelectedIcon : UIImage { return UIImage.fontAwesomeIcon(name: .search, style: .solid, textColor: .white, size: tabbarIconSize)}
    
    //Third Icon
    static var tabBar2Icon : UIImage { return UIImage.fontAwesomeIcon(name: .bell, style: .solid, textColor: AppColors.grayColor, size: tabbarIconSize)}
    static var tabBar2SelectedIcon : UIImage { return UIImage.fontAwesomeIcon(name: .bell, style: .solid, textColor: .white, size: tabbarIconSize)}
    
    //forth Icon
    static var tabBar3Icon : UIImage { return UIImage.fontAwesomeIcon(name: .user, style: .solid, textColor: AppColors.grayColor, size: tabbarIconSize)}
    static var tabBar3SelectedIcon : UIImage { return UIImage.fontAwesomeIcon(name: .user, style: .solid, textColor: .white, size: tabbarIconSize)}
    
    ////
    
    
    
    static var plusIcon : UIImage { return UIImage.fontAwesomeIcon(name: .plus, style: .solid, textColor: .white, size: smallIconSize)}
   
    static var shareIcon : UIImage { return UIImage.fontAwesomeIcon(name: .shareAlt, style: .solid, textColor: AppColors.grayColor, size: smallIconSize)}
    
    static var commentIcon : UIImage { return UIImage.fontAwesomeIcon(name: .commentAlt, style: .solid, textColor: AppColors.grayColor, size: smallIconSize)}
    
    static var starBigIcon : UIImage { return UIImage.fontAwesomeIcon(name: .star, style: .solid, textColor: .white, size: tabbarIconSize)}
    static func starIcon(color:UIColor, size:Int) -> UIImage{
        return UIImage.fontAwesomeIcon(name: .star, style: .solid, textColor: color, size: CGSize(width: size, height: size))
    }
    
    static var nextIconGray : UIImage { return UIImage.fontAwesomeIcon(name: .chevronRight, style: .solid, textColor: AppColors.lightGrayColor, size: tabbarIconSize)}
    
    
}



