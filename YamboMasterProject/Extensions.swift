//
//  Extensions.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/27/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

// MARK: - UIImageView Round Edges

extension UIImageView {
    
    func setRounded() {
        self.layoutSubviews()
        let radius = self.frame.height / 2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
}

// MARK: - UINavigationItem Bar Button

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

// MARK: - UIColor App Theme

extension UIColor {
    
    static let yamboBabyGreen = UIColor(red: 244/255, green: 247/255, blue: 249/255, alpha: 1)
    static let yamboBlue = UIColor(red: 40/255, green: 45/255, blue: 84/255, alpha: 1)
    static let yamboLightBlue = UIColor(red: 72/255, green: 81/255, blue: 145/255, alpha: 1)
    static let aqua = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1)
    static let silver = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
}

// MARK: - UILabel Round Edges

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













