//
//  CustomCellTableViewCell.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/04/01.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import UIKit

@IBDesignable
class CustomCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: DesignableUIImageView!
    @IBOutlet weak var profileImageView: DesignableUIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
