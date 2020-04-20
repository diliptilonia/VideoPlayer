//
//  ViewController.swift
//  MVVM
//
//  Created by Dilip Gurjar on 09/04/20.
//  Copyright © 2020 Dilip Gurjar. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var tableInstance: UITableView!
    
    var viweModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viweModelUser.vc = self
        viweModelUser.getAllUserAF()
        setUpNavigationBar()
    
    }
    
    @IBAction func facebookLogInBtnTapped(_ sender: Any) {
        let manager = LoginManager()
        
        manager.logOut()
        manager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if error != nil {
                print("Error")
            }
            let finalResult = result!
            if finalResult.isCancelled {
                print("Error in data")
            }
            print("Access Token \(finalResult.token)")
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, first_name, last_name, picture"]).start(completionHandler: { (connection, result, error) -> Void in
                print(result)
            })
        }
    }
    
    func setUpNavigationBar() {
      self.title = "MY Video"
      self.navigationController?.isNavigationBarHidden = false
      UIApplication.shared.isStatusBarHidden = false
      self.navigationController?.navigationBar.isHidden = false
      self.navigationController?.navigationBar.isTranslucent = false
      self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
      
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuSimpleLineIcons"), style: .plain, target: self, action: #selector(menuButtonClicked))
      //remove navigation bar bottom line
      let navigationBar = self.navigationController?.navigationBar
      navigationBar?.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
      navigationBar?.shadowImage = UIImage()
      
      // set navigation bar color
      self.navigationController?.navigationBar.barTintColor = UIColor(red: 200/255.0, green: 17/255.0, blue: 17/255.0, alpha: 1.0)
      self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @objc func menuButtonClicked() {
        self.sideMenuController?.showLeftView()
    }
    

}

typealias TableMethos = UITableViewDelegate & UITableViewDataSource

extension ViewController: TableMethos {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viweModelUser.userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableInstance.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        cell.updateCell = viweModelUser.userArr[indexPath.row]
//        let id = viweModelUser.userArr[indexPath.row].id
//        cell.lblId.text = String(id!)
//        cell.lblTitle.text = viweModelUser.userArr[indexPath.row].title
        
        return cell
    }
    
    
    
}


