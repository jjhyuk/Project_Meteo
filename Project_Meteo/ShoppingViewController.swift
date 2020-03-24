//
//  ShoppingViewController.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/23.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

class ShoppingViewController:UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var checkGesture:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        gestureSetup()
    }
}

extension ShoppingViewController:UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView
        : UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "scrollViewCell") as! scrollViewCell
            
            tableView.rowHeight = 224
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "horizontalCell")!
            
            tableView.rowHeight = 108
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "collectionViewCell") as! collectionViewinTableView
            
            tableView.rowHeight = 634
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableCell(withIdentifier: "Header")
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 52
    }
}

extension ShoppingViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
    
    @objc func down(sender: UIGestureRecognizer) {
        
        if(checkGesture){
            print("down")
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.searchBar!.frame = CGRect(x: 0.0, y: 44.0, width: self.view.frame.width, height: self.searchBar.frame.height)
                self.searchBar!.alpha = 1
                self.tableView!.frame = CGRect(x: 0.0, y: 44.0 + self.searchBar.frame.height, width: self.view.frame.width, height: self.tableView.frame.height - self.searchBar.frame.height)
            }, completion: { (Bool) -> Void in
                self.checkGesture = false
            })
        }
    }
    
    @objc func up(sender: UIGestureRecognizer) {
        
        if(!checkGesture){
            print("up")
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.searchBar!.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.searchBar.frame.height)
                self.searchBar!.alpha = 0
                self.tableView!.frame = CGRect(x: 0.0, y: self.searchBar.frame.height, width: self.view.frame.width, height: self.tableView.frame.height + self.searchBar.frame.height)
            }, completion: { (Bool) -> Void in
                self.checkGesture = true
            })
        }
    }
    
    func gestureSetup() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(down))
        swipeDown.direction = .down
        swipeDown.delegate = self
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(up))
        swipeUp.direction = .up
        swipeUp.delegate = self
        
        
        tableView.addGestureRecognizer(swipeDown)
        tableView.addGestureRecognizer(swipeUp)
    }
}
