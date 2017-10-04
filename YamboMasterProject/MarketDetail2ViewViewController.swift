//
//  MarketplaceDetailView2ViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/18/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MarketDetail2ViewViewController: UIViewController {
    
    @IBOutlet var marketDetail2View: MarketDetail2View!
    var market: Market?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadMarketData()
        self.navigationItem.loadRightBarButtonItem()
    }
    
    func loadMarketData() {
        guard let itemImage = market?.itemImage else {return}
        marketDetail2View.itemImageView.image = UIImage(named: itemImage)
        guard let thumbImage1 = market?.thumbnailImage1 else {return}
        marketDetail2View.thumbImageView1.image = UIImage(named: thumbImage1)
        guard let thumbImage2 = market?.thumbnailImage2 else {return}
        marketDetail2View.thumbImageView2.image = UIImage(named: thumbImage2)
        guard let thumbImage3 = market?.thumbnailImage3 else {return}
        marketDetail2View.thumbImageView3.image = UIImage(named: thumbImage3)
        guard let thumbImage4 = market?.thumbnailImage4 else {return}
        marketDetail2View.thumbImageView4.image = UIImage(named: thumbImage4)
        guard let thumbImage5 = market?.thumbnailImage5 else {return}
        marketDetail2View.thumbImageView5.image = UIImage(named: thumbImage5)
        guard let thumbImage6 = market?.thumbnailImage3 else {return}
        marketDetail2View.thumbImageView6.image = UIImage(named: thumbImage6)
    }

    @IBAction func thumbImage1TApped(_ sender: Any) {
        guard let thumbImage1 = market?.thumbnailImage1 else {return}
        marketDetail2View.itemImageView.image = UIImage(named: thumbImage1)
    }
    
    @IBAction func thumbImage2TApped(_ sender: Any) {
        guard let thumbImage2 = market?.thumbnailImage2 else {return}
        marketDetail2View.itemImageView.image = UIImage(named: thumbImage2)
    }
    
    @IBAction func thumbImage3TApped(_ sender: Any) {
        guard let thumbImage3 = market?.thumbnailImage3 else {return}
        marketDetail2View.itemImageView.image = UIImage(named: thumbImage3)
    }
    
    @IBAction func thumbImage4TApped(_ sender: Any) {
        guard let thumbImage4 = market?.thumbnailImage4 else {return}
        marketDetail2View.itemImageView.image = UIImage(named: thumbImage4)
    }
    
    @IBAction func thumbImage5TApped(_ sender: Any) {
        guard let thumbImage5 = market?.thumbnailImage5 else {return}
        marketDetail2View.itemImageView.image = UIImage(named: thumbImage5)
    }
    
    @IBAction func thumbImage6TApped(_ sender: Any) {
        guard let thumbImage3 = market?.thumbnailImage3 else {return}
        marketDetail2View.itemImageView.image = UIImage(named: thumbImage3)
    }
    
}
