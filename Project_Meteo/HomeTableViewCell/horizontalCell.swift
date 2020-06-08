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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTable()
    }
    
    func setUpTable(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: 128, height: 128)
        layout.sectionInset = .init(top: 0, left: 6, bottom: 0, right: 2
        )
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
    }
    
}

extension horizontalCell:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontal_cell", for: indexPath)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        MeteoLog(collectionView)
    }
    
}

