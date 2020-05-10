//
//  horizontalCell.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/23.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

class horizontalCell:UITableViewCell {
    
    @IBOutlet weak var tableView: DesignableTableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTable()
    }
    
    func setUpTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension horizontalCell:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "horizontal_cell", for: indexPath) as! DesignableTableViewCell
        
        cell.iconImage.image = UIImage(named: "Add")
        cell.iconTitle.text = "Test"
        cell.frame = CGRect(x: 0, y: 0, width: 108, height: 108)
        return cell
    }
    
    
}
