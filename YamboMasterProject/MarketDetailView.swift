
//
//  MarketplaceDetailCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketDetailView: UIView {
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemDetailLabel: UILabel!
    @IBOutlet var residentNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    @IBOutlet var itemDescriptionLabel: UILabel!
    @IBOutlet var thumbImageView1: UIImageView!
    @IBOutlet var thumbImageView2: UIImageView!
    @IBOutlet var thumbImageView3: UIImageView!
    @IBOutlet var thumbImageView4: UIImageView!
    @IBOutlet var thumbImageView5: UIImageView!
    @IBOutlet var thumbImageView6: UIImageView!
    
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
                thumbImageView1.image = UIImage(named: market.thumbnailImage1)
                thumbImageView2.image = UIImage(named: market.thumbnailImage2)
                thumbImageView3.image = UIImage(named: market.thumbnailImage3)
                thumbImageView4.image = UIImage(named: market.thumbnailImage4)
                thumbImageView5.image = UIImage(named: market.thumbnailImage5)
                thumbImageView6.image = UIImage(named: market.thumbnailImage6)
            }
        }
    }
}


















