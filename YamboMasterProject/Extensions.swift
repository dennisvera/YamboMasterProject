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
