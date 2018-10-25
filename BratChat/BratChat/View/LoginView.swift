//
//  LoginView.swift
//  BratChat
//
//  Created by David E Bratton on 10/25/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class RoundedCorners: UIView {
    override func awakeFromNib() {
        layer.cornerRadius = 20
    }
}

class RoundedButtons: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 20
    }
}
