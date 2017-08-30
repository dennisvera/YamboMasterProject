//
//  MarketplaceTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/29/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

class MarketplaceTableViewController: UITableViewController {
    fileprivate var menu: MenuView!
    
    let itemImages = ["marketplace1.jpg", "marketplace2.jpg", "marketplace3.jpg", "marketplace4.jpg", "marketplace5.jpg"]
    let itemDetail = ["Vendo bici GIANT en buenas condiciones", "Se vende BMW X3 2012", "Renta de cajón de estacionamiento, Torre D", "Mensaje", "Mensaje"]
    let resident = ["Alberto Ramirez A-401", "Carlos Sanz F-801", "Alberto Ramirez A-401", "Carlos Sanz F-801", "Alberto Ramirez A-401"]
    let itemPrice = ["$8,500", "$329,000", "precio a negociar", "$7,200", "$500"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenu()
    }
    
    fileprivate func loadMenu() {
        menu = {
            let menu = MenuView()
            menu.delegate = self as? MenuViewDelegate
            menu.items = items
            return menu
        }()
        
        tableView.addSubview(menu)
    }
    
    // MARK: - Items
    fileprivate let items = (0..<8).map {
        MenuItem(title: "Reservaciones", image: UIImage(named: "menu_icon_\($0)")!)
    }
    
    // MARK: - Actions
    @IBAction fileprivate func switchMenu() {
        menu.setRevealed(!menu.revealed, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemImages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("MarketplaceTableViewCell", owner: self, options: nil)?.first as! MarketplaceTableViewCell
        
        let image = UIImage(named: itemImages[indexPath.row])
        cell.itemImageView.image = image
        cell.itemDetailLabel.text = itemDetail[indexPath.row]
        cell.residentNameLabel.text = resident[indexPath.row]
        cell.itemPriceLabel.text = itemPrice[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }


}
