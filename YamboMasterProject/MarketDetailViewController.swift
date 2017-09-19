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
    var market: Market?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MarketDetailViewController.imageTapped(recognizer:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        
//        marketDetailView.thumbnailImageView1.isUserInteractionEnabled = true
//        marketDetailView.thumbnailImageView1.addGestureRecognizer(tapGestureRecognizer)
        
        loadMarketData()
        loadNavigationBar()
    }
    
    func loadNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor(red: 40/255, green: 45/255, blue: 84/255, alpha: 1)
    }
    
    func loadMarketData() {
        guard let itemImage = market?.itemImage else {return}
        marketDetailView.itemImageView.image = UIImage(named: itemImage)
        guard let itemDetail = market?.itemDetail else {return}
        marketDetailView.itemDetailLabel.text = itemDetail
        guard let resident = market?.resident else {return}
        marketDetailView.residentNameLabel.text = resident
        guard let itemPrice = market?.itemPrice else {return}
        marketDetailView.itemPriceLabel.text = itemPrice
        guard let itemDescription = market?.itemDescription else {return}
        marketDetailView.itemDescriptionLabel.text = itemDescription
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "MarketDetail2Segue", sender: sender)
    }
    
    func imageTapped (recognizer: UITapGestureRecognizer) {
        marketDetailView.itemImageView.image = UIImage(named: "marketplace1.jpg")
    }
    
}







