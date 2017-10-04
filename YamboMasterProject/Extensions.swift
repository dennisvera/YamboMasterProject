//
//  Extensions.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/27/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layoutSubviews()
        let radius = self.frame.height / 2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
}

extension UINavigationItem {
    
    func loadRightBarButtonItem() {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "navBarProfileImage"), for: UIControlState.normal)
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        button.clipsToBounds = true
        button.layer.cornerRadius = button.frame.width / 2
        let barButton = UIBarButtonItem(customView: button)
        self.rightBarButtonItem = barButton
    }
}

extension UIColor {
    
    static let yamboBabyGreen = UIColor(red: 244/255, green: 247/255, blue: 249/255, alpha: 1)
    static let yamboBlue = UIColor(red: 40/255, green: 45/255, blue: 84/255, alpha: 1)
    static let aqua = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1)
}

extension UILabel {
    
    func setRoundEdge() {
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.textColor = .white
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}













