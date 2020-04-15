//
//  AccountViewController.swift
//  Project_Meteo
//
//  Created by jinhyuk on 2020/04/06.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa

import RxDataSources


class AccountViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var settingLabel: UILabel!
    
    var tableViewItems = BehaviorRelay(value: [String]())
    let disposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        self.tableView.contentInset.top = self.headerView.frame.size.height - 30
        
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView
        : UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell")!
            
            tableView.rowHeight = 76
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell")!
            
            tableView.rowHeight = 76
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell")!
            
            tableView.rowHeight = 76
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell")!
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableCell(withIdentifier: "AccountHeader")
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = tableView.dequeueReusableCell(withIdentifier: "AccountFooter")
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}
