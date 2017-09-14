//
//  MarketplaceTableViewCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/29/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketplaceCell: UITableViewCell {
    
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
    
    var marketplace: MarketPlace? {
        didSet {
            if let marketplace = marketplace {
                residentNameLabel.text = marketplace.resident
                itemImageView.image = UIImage(named: marketplace.itemPhoto)
                itemDetailLabel.text = marketplace.itemDetail
                itemPriceLabel.text = marketplace.itemPrice
            }
        }
    }
    
}
