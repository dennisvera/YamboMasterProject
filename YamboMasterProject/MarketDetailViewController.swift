//
//  MarketplaceDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

private let marketDetail2Segue = "MarketDetail2Segue"

class MarketDetailViewController: UIViewController {
    
    @IBOutlet var marketDetailView: MarketDetailView!
    var market: Market?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMarketData()
        loadNavigationBar()
        self.navigationItem.loadRightBarButtonItem()
    }
    
    func loadNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .yamboBlue
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
        
        guard let thumbImage1 = market?.thumbnailImage1 else {return}
        marketDetailView.thumbImageView1.image = UIImage(named: thumbImage1)
        guard let thumbImage2 = market?.thumbnailImage2 else {return}
        marketDetailView.thumbImageView2.image = UIImage(named: thumbImage2)
        guard let thumbImage3 = market?.thumbnailImage3 else {return}
        marketDetailView.thumbImageView3.image = UIImage(named: thumbImage3)
        guard let thumbImage4 = market?.thumbnailImage4 else {return}
        marketDetailView.thumbImageView4.image = UIImage(named: thumbImage4)
        guard let thumbImage5 = market?.thumbnailImage5 else {return}
        marketDetailView.thumbImageView5.image = UIImage(named: thumbImage5)
        guard let thumbImage6 = market?.thumbnailImage3 else {return}
        marketDetailView.thumbImageView6.image = UIImage(named: thumbImage6)
    }
    
    @IBAction func thumbImageTApped(_ sender: Any) {
        guard let thumbImage1 = market?.thumbnailImage1 else {return}
        marketDetailView.itemImageView.image = UIImage(named: thumbImage1)
    }
    
    @IBAction func thumbImage2Tapped(_ sender: Any) {
        guard let thumbImage2 = market?.thumbnailImage2 else {return}
        marketDetailView.itemImageView.image = UIImage(named: thumbImage2)
    }
    
    @IBAction func thumbImage3Tapped(_ sender: Any) {
        guard let thumbImage3 = market?.thumbnailImage3 else {return}
        marketDetailView.itemImageView.image = UIImage(named: thumbImage3)
    }
    
    @IBAction func thumbImage4Tapped(_ sender: Any) {
        guard let thumbImage4 = market?.thumbnailImage4 else {return}
        marketDetailView.itemImageView.image = UIImage(named: thumbImage4)
    }
    
    @IBAction func thumbImage5Tapped(_ sender: Any) {
        guard let thumbImage5 = market?.thumbnailImage5 else {return}
        marketDetailView.itemImageView.image = UIImage(named: thumbImage5)
    }
    
    @IBAction func thumbImage6Tapped(_ sender: Any) {
        guard let thumbImage3 = market?.thumbnailImage3 else {return}
        marketDetailView.itemImageView.image = UIImage(named: thumbImage3)
    }
    
    @IBAction func contactarButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "MarketDetail2Segue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == marketDetail2Segue {
            let detailViewController = segue.destination as? MarketDetail2ViewViewController
            detailViewController?.market = market
        }
    }
    
}








