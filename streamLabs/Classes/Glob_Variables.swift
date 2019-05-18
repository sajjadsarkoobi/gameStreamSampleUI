//
//  Glob_Variables.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation

//Detect if this is an iPhoneX
var IsiPhoneX: Bool {
    var model: String
    
    var size = 0
    sysctlbyname("hw.machine", nil, &size, nil, 0)
    var machine = [CChar](repeating: 0, count: size)
    sysctlbyname("hw.machine", &machine, &size, nil, 0)
    model = String(cString: machine)
    
    #if (arch(i386) || arch(x86_64))
    model = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] ?? ""
    #endif
    
    return model == "iPhone10,3" || model == "iPhone10,6" || model.starts(with: "iPhone11,")
}
