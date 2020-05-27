//
//  DesignableUIImageView.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/04/01.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class DesignableUIImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
    
}
