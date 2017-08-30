//
//  ReservacionesTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/24/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

class ReservacionesTableViewController: UITableViewController {
    fileprivate var menu: MenuView!

    let backgroundImages = ["reservaciones1.jpg", "reservaciones2.jpg", "reservaciones3.jpg", "reservaciones4.jpg", "reservaciones5.jpg"]
    let titles = ["BOLICHE", "TENIS", "ALBERCA", "CINE", "ASADORES"]
    
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
        return backgroundImages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("ReservacionesTableViewCell", owner: self, options: nil)?.first as! ReservacionesTableViewCell
        let image = UIImage(named: backgroundImages[indexPath.row])
        cell.bkgImageView.image = image
        cell.titleLabel.text = titles[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }

}
