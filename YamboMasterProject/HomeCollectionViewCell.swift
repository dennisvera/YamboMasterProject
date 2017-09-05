//
//  HomePageCollectionViewCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/1/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backgroundCellView: UIView!
    @IBOutlet var menuIconImageView: UIImageView!
    @IBOutlet var menuTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCellView.layer.cornerRadius = 10
    }

}
