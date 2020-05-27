//
//  DesignableUILabel.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/17.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableUILabel: UILabel {
    
    @IBInspectable var changeText: String? {
        didSet {
            decorate()
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.red {
        didSet {
            decorate()
        }
    }
    
    /*** more inspectable var can be added **/
    
    func decorate() {
        
        if changeText != nil
        {
            let attributedStr = NSMutableAttributedString(string: text!)
            
            attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: fontColor, range: (text! as NSString).range(of: changeText!))
            
            attributedStr.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.thick.rawValue, range: (text! as NSString).range(of: changeText!))
            
            attributedStr.addAttribute(NSAttributedString.Key.underlineColor, value: fontColor, range: (text! as NSString).range(of: changeText!))

            attributedText = attributedStr
        }
    }
    

    
}

