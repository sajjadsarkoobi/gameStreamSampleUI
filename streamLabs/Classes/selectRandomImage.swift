//
//  selectRandomImage.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/21/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation
import UIKit

func randomImage() -> UIImage {
    let numberOfImages: UInt32 = 16
    let random = arc4random_uniform(numberOfImages)
    let imageName = "avatar\(random)"
    return UIImage(named: imageName) ?? UIImage(named: "avatarPlaceHolder")!
}
