//
//  MarketplaceDetailCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketplaceDetailView: UIView {
    
    @IBOutlet var contentView: UIView!    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemDetailLabel: UILabel!
    @IBOutlet var residentNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("MarketplaceDetailView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    var marketplaceDetail: MarketPlace? {
        didSet {
            if let marketplaceDetail = marketplaceDetail {
                itemImageView.image = UIImage(named: marketplaceDetail.itemPhoto)
                itemDetailLabel.text = marketplaceDetail.itemDetail
                itemPriceLabel.text = marketplaceDetail.itemPrice
                residentNameLabel.text = marketplaceDetail.resident
            }
        }
    }

    
}
