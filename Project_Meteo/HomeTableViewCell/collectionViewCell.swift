//
//  collectionViewCell.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/24.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

class collectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemFinalPrice: UILabel!
    @IBOutlet weak var itemOriginPrice: UILabel!
    @IBOutlet weak var itemDiscountPercent: UILabel!
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
            layer.cornerRadius = 8
        }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
    }
}
