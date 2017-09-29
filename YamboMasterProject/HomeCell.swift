//
//  HomeCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/23/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet var menuBackgroundView: UIView!
    @IBOutlet var menuImageView: UIImageView!
    @IBOutlet var menuNameLabel: UILabel!
    
    override func prepareForReuse() {
        menuNameLabel.text = ""
        menuImageView.image = nil
    }
    
    var home: Home? {
        didSet {
            if let home = home {
                menuNameLabel.text = home.menuTitle
                menuBackgroundView.layer.cornerRadius = 10
                menuImageView.image = UIImage(named: home.menuImage)
            }
        }
    }
    
}
