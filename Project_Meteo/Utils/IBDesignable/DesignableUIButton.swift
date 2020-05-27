//
//  DesignableUIButton.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/17.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableUIButton: UIButton {
    
    @IBInspectable var ImageRightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            image.withRenderingMode(.alwaysTemplate)
            self.setImage(image, for: .normal)
            self.adjustsImageWhenHighlighted = false
            self.semanticContentAttribute = .forceLeftToRight
            self.imageEdgeInsets = .init(top: 1, left: 1, bottom: 1, right: 0)
            self.titleEdgeInsets.left = ImageRightPadding
        } else {
            
        }
        
    }
    
 
    
}
