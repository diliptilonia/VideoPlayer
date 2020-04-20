//
//  Custombutton.swift
//  MVVM
//
//  Created by Dilip Gurjar on 19/04/20.
//  Copyright © 2020 Dilip Gurjar. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius

        }
    }
}
