//
//  collectionView.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/24.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

class collectionViewinTableView: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollection()
    }
    
    func setUpCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension collectionViewinTableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! collectionViewCell
        
        cell.itemImage.image = UIImage(named: "Cart")
        cell.itemTitle.text = "Product"
        cell.itemFinalPrice.text = "9900원"
        cell.itemOriginPrice.text = "12000원"
        cell.itemDiscountPercent.text = "30% off"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width/2 - 20, height: UIScreen.main.bounds.size.height/3 - 10)
    }
    
}
