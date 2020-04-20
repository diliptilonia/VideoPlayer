//
//  UserCell.swift
//  MVVM
//
//  Created by Dilip Gurjar on 09/04/20.
//  Copyright © 2020 Dilip Gurjar. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    var updateCell: UserModel? {
        didSet {
            if let id = updateCell?.id {
                lblId.text = "\(id)"
            }
            
            lblTitle.text = updateCell?.title
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
