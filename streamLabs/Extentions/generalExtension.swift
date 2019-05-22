//
//  generalExtension.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/18/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    //Replace Image in middle of a string
    func addImageInText(replaceWith:String,image:UIImage,imageOffsetY:CGFloat = -5,imageSize:CGFloat = 0)-> NSMutableAttributedString{
        
        if !self.contains(replaceWith) {
            return NSMutableAttributedString(string: self)
        }
        
        var dataString = self.components(separatedBy: replaceWith)
        
        let imageAttachment =  NSTextAttachment()
        imageAttachment.image = image
        
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY,
                                        width:imageSize > 0 ? imageSize : imageAttachment.image!.size.width,
                                        height: imageSize > 0 ? imageSize : imageAttachment.image!.size.height)
        
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        
        let completeText = NSMutableAttributedString(string: dataString[0])
        
        completeText.append(attachmentString)
        
        if dataString.indices.contains(1){
            completeText.append(NSMutableAttributedString(string: dataString[1]))
        }
        
        return completeText
    }
}


extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0.5...1),
                       green: .random(in: 0.5...1),
                       blue: .random(in: 0.5...1),
                       alpha: 1.0)
    }
}
