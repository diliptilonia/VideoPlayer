//
//  SideMenuVC.swift
//  MVVM
//
//  Created by Dilip Gurjar on 15/04/20.
//  Copyright © 2020 Dilip Gurjar. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var tableInstance: UITableView!
    
    var tableArr: [String] = ["Home", "Cards", "Friends List", "Setting"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableInstance.dequeueReusableCell(withIdentifier: "SideMenuCell")
        cell?.textLabel?.text = tableArr[indexPath.row]
        return cell!
    }
    
    
}

class SideMenuCell: UITableViewCell {
    
}
