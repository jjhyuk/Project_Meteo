//
//  ShoppingViewController.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/03/23.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit

class ShoppingViewController:UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        setup()
    }
    
    @objc func down(sender: UIGestureRecognizer) {
        print("down")
        //show bar
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.searchBar!.frame = CGRect(x: 0.0, y: 44.0, width: self.view.frame.width, height: self.searchBar.frame.height)
            self.searchBar!.alpha = 1
            self.tableView!.frame = CGRect(x: 0.0, y: 44.0 + self.searchBar.frame.height, width: self.view.frame.width, height: self.tableView.frame.height - self.searchBar.frame.height)
        }, completion: { (Bool) -> Void in
        })
    }

    @objc func up(sender: UIGestureRecognizer) {
        print("up")
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.searchBar!.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.searchBar.frame.height)
            self.searchBar!.alpha = 0
            self.tableView!.frame = CGRect(x: 0.0, y: self.searchBar.frame.height, width: self.view.frame.width, height: self.tableView.frame.height + self.searchBar.frame.height)
        }, completion: { (Bool) -> Void in
        })
    }
    
    func setup() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(down))
        swipeDown.direction = .down
        swipeDown.delegate = self
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(up))
        swipeUp.direction = .up
        swipeUp.delegate = self
        

        tableView.addGestureRecognizer(swipeDown)
        tableView.addGestureRecognizer(swipeUp)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
    }
}

extension ShoppingViewController:UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "scrollViewCell") as! scrollViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "horizontal_icon") as! UITableViewCell
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableCell(withIdentifier: "Header")
        
        if section == 0 {
            return nil
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 52
    }
    
    
}
