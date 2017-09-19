//
//  MarketplaceDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketDetailViewController: UIViewController {
    @IBOutlet var marketDetailView: MarketDetailView!
    var marketPlace: MarketPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor(red: 40/255, green: 45/255, blue: 84/255, alpha: 1)
        
        guard let itemImage = marketPlace?.itemPhoto else {return}
        marketDetailView.itemImageView.image = UIImage(named: itemImage)
        guard let itemDetail = marketPlace?.itemDetail else {return}
        marketDetailView.itemDetailLabel.text = itemDetail
        guard let resident = marketPlace?.resident else {return}
        marketDetailView.residentNameLabel.text = resident
        guard let itemPrice = marketPlace?.itemPrice else {return}
        marketDetailView.itemPriceLabel.text = itemPrice
        guard let itemDescription = marketPlace?.itemDescription else {return}
        marketDetailView.itemDescriptionLabel.text = itemDescription
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("contactar button tapped")
    }


}
