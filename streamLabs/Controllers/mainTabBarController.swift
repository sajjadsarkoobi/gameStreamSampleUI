//
//  mainTabBarController.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import UIKit
import Foundation
import FontAwesome_swift

class mainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tabBar.items?[0].image = nil
        self.tabBar.items?[1].image = nil
        self.tabBar.items?[2].image = nil
        self.tabBar.items?[3].image = nil
        
        self.tabBar.items?[0].imageInsets = UIEdgeInsets.init(top: 6,left: 0,bottom: -6,right: 0)
        self.tabBar.items?[1].imageInsets = UIEdgeInsets.init(top: 6,left: 0,bottom: -6,right: 0)
        self.tabBar.items?[2].imageInsets = UIEdgeInsets.init(top: 6,left: 0,bottom: -6,right: 0)
        self.tabBar.items?[3].imageInsets = UIEdgeInsets.init(top: 6,left: 0,bottom: -6,right: 0)
        
        self.tabBar.items?[0].title = ""
        self.tabBar.items?[1].title = ""
        self.tabBar.items?[2].title = ""
        self.tabBar.items?[3].title = ""
        
        //default colors
        self.tabBar.barStyle = .blackOpaque
        self.view.backgroundColor = AppColors.mainAppColor
        self.tabBar.tintColor = .white
        UITabBar.appearance().barTintColor = AppColors.mainAppColor
        
        
        self.tabBar.items?[0].image = fontImages.tabBar0Icon
        self.tabBar.items?[0].selectedImage = fontImages.tabBar0SelectedIcon
        
        self.tabBar.items?[1].image = fontImages.tabBar1Icon
        self.tabBar.items?[1].selectedImage = fontImages.tabBar1SelectedIcon
        
        self.tabBar.items?[2].image = fontImages.tabBar2Icon
        self.tabBar.items?[2].selectedImage = fontImages.tabBar2SelectedIcon
        
        self.tabBar.items?[3].image = fontImages.tabBar3Icon
        self.tabBar.items?[3].selectedImage = fontImages.tabBar3SelectedIcon
 
        
        
        
        
        //Add Red Dot for notification Tab
        ///Later we can use it for all tabs
        let dotView = self.addDotInTabbar(index: 2)
        self.tabBar.addSubview(dotView)
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = self.tabBar.items?.firstIndex(of: item)
        let subView = tabBar.subviews[index!+1].subviews.first as! UIImageView
        self.performSpringAnimation(imgView: subView)
    }
    
    //func to perform spring animation on imageview of Tabbars
    func performSpringAnimation(imgView: UIImageView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            imgView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            //reducing the size
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { (flag) in
            }
        }) { (flag) in
            
        }
    }
    
    
    func addDotInTabbar(index:CGFloat) -> UIView{
        let rect = CGRect(x: ( tabBar.frame.width / 4 ) * ( index ) + ( tabBar.frame.width / 8 ) + 5, y:  5 , width:5, height: 5)
        
        let dotView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            view.frame = rect
            
            return view
        }()
        dotView.round()
        dotView.tag = 5000 + Int(index)
        return dotView
    }
    
    

}
