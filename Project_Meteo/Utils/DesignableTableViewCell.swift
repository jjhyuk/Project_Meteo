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

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconTitle: UILabel!
    
    @IBInspectable var isHorizontal: Int {
        set{
            if newValue == 1 {
                let orginFrame = frame
                transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
                frame = CGRect(x: 0, y: 0, width: 108, height: 108)
            }
        }
        get{
            return isHorizontal
        }
    }
}
