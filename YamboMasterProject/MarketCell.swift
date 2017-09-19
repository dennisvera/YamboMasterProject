//
//  MarketplaceTableViewCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/29/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketCell: UITableViewCell {
    
    @IBOutlet var residentNameLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemDetailLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!

    override func prepareForReuse() {
        itemImageView.image = nil
        itemDetailLabel.text = ""
        itemPriceLabel.text = ""
        residentNameLabel.text = ""
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var market: Market? {
        didSet {
            if let market = market {
                residentNameLabel.text = market.resident
                itemImageView.image = UIImage(named: market.itemImage)
                itemDetailLabel.text = market.itemDetail
                itemPriceLabel.text = market.itemPrice
            }
        }
    }
    
}
