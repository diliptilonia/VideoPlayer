//
//  UserViewModel.swift
//  MVVM
//
//  Created by Dilip Gurjar on 09/04/20.
//  Copyright © 2020 Dilip Gurjar. All rights reserved.
//

import UIKit
import Alamofire



protocol testCaseProtocole: class {
    func addTwoNumber(num1: Int, num2: Int) -> Int
}

class UserViewModel: testCaseProtocole {
    weak var vc: ViewController?
    var userArr = [UserModel]()
    
    func getAllUserAF() {
        AF.request("https://jsonplaceholder.typicode.com/todos").response
            { response in
                if let data = response.data {
                    
                    let userInfo = try! JSONDecoder().decode([UserModel].self, from: data)
                    self.userArr.append(contentsOf: userInfo)
                    DispatchQueue.main.async {
                        self.vc?.tableInstance.reloadData()
                    }
                    print(self.userArr)
                    
                }
        }
    }
    
    func getAllUserData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error == nil {
                if let data = data {
                    
                    let userInfo = try! JSONDecoder().decode([UserModel].self, from: data)
                    self.userArr.append(contentsOf: userInfo)
                    DispatchQueue.main.async {
                        self.vc?.tableInstance.reloadData()
                    }
                    print(self.userArr)
                    
                }
                
            } else {
                print("Error is \(error)")
            }
        })
        task.resume()
    }
    
    func addTwoNumber(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}

