//
//  MarketplaceDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketplaceDetailViewController: UIViewController {
    @IBOutlet var marketDetailView: MarketplaceDetailView!
    var marketPlace: MarketPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let marketItemPhoto = marketPlace?.itemPhoto else {return}
        marketDetailView.itemImageView.image = UIImage(named: marketItemPhoto)
        guard let marketItemDetail = marketPlace?.itemDetail else {return}
        marketDetailView.itemDetailLabel.text = marketItemDetail
        guard let resident = marketPlace?.resident else {return}
        marketDetailView.residentNameLabel.text = resident
        guard let marketItemPrice = marketPlace?.itemPrice else {return}
        marketDetailView.itemPriceLabel.text = marketItemPrice
    }

}
