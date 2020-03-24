//
//  DesignableTableView.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/22.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableTableView:UITableView {
    
    @IBInspectable var isHorizontal: Bool {
        set{
            if newValue == true {
                let orginFrame = frame
                transform = CGAffineTransform(rotationAngle: -CGFloat(M_PI_2))
                frame = orginFrame
            }
        }
        get{
            return isHorizontal
        }
    }
}
