
//
//  MarketplaceDetailCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

private let nibName = "MarketDetailView"
private let reuseIdentifierSegue = "MarketDetail2Segue"

class MarketDetailView: UIView {
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemDetailLabel: UILabel!
    @IBOutlet var residentNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    @IBOutlet var itemDescriptionLabel: UILabel!
    @IBOutlet var thumbnailImageView1: UIImageView!
    @IBOutlet var thumbnailImageView2: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var market: Market? {
        didSet {
            if let market = market {
                itemImageView.image = UIImage(named: market.itemImage)
                itemDetailLabel.text = market.itemDetail
                itemPriceLabel.text = market.itemPrice
                residentNameLabel.text = market.resident
                itemDescriptionLabel.text = market.itemDescription
                thumbnailImageView1.image = UIImage(named: "\(thumbnailImageView2)")
            }
        }
    }

}


















