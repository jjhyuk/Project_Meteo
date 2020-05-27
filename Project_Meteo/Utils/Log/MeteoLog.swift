//
//  MeteoLog.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/05/27.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation

func MeteoLog(filename: String = #file, line: Int = #line, funcname: String = #function, _ output:Any?...) {
    
    //이쁘게 나오게 해야함 
    #if DEBUG
    let now = NSDate()
    guard !output.isEmpty else { print("[\(now.description)][\(filename.components(separatedBy: "/").last!)][\(funcname)][Line \(line)]"); return }
    
    print("[\(now.description)][\(filename.components(separatedBy: "/").last!)][\(funcname)][Line \(line)]\n\(output as AnyObject)")
    
    #endif
}

