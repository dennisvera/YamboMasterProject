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
