//
//  DesignableTableViewCell.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/22.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableTableViewCell:UITableViewCell {
    
    @IBInspectable var isHorizontal: Int {
        set{
            if newValue == 1 {
                let orginFrame = frame
                transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
                frame = orginFrame
            }
        }
        get{
            return isHorizontal
        }
    }
}
