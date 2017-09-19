
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
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MarketDetailView.imageTapped(recognizer:)))
//        tapGestureRecognizer.numberOfTapsRequired = 1
//        
//        thumbnailImageView1.isUserInteractionEnabled = true
//        thumbnailImageView1.addGestureRecognizer(tapGestureRecognizer)
    }

    var marketplace: MarketPlace? {
        didSet {
            if let marketplace = marketplace {
                itemImageView.image = UIImage(named: marketplace.itemPhoto)
                itemDetailLabel.text = marketplace.itemDetail
                itemPriceLabel.text = marketplace.itemPrice
                residentNameLabel.text = marketplace.resident
                itemDescriptionLabel.text = marketplace.itemDescription
                thumbnailImageView1.image = UIImage(named: "\(thumbnailImageView2)")
            }
        }
    }
    
    func imageTapped (recognizer: UITapGestureRecognizer) {
        print("image tapped")
    }

}


















