//
//  CustomNavigationBar.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/20.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableNavigationBar: UINavigationBar
{   
    
    
    @IBInspectable var hiddenShadow:Bool {
        get{
            return hiddenShadow
        }
        set{
            shadowImage = UIImage()
        }
    }
    
}
