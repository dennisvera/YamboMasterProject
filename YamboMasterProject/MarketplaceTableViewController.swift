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
    var menuItems = [MenuItem]()
    var menuModel = MenuType()
    var marketplaceModel = MarketplaceType()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (IconName, name) in zip(menuModel.menuIcons, menuModel.menuNames) {
            menuItems.append(MenuItem(name: name, image: UIImage(named: IconName)))
        }
        
        loadMenu()
    }
    
    fileprivate func loadMenu() {
        menu = {
            let menu = MenuView()
            menu.delegate = self
            menu.items = menuItems
            return menu
        }()
        
        tableView.addSubview(menu)
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
        return marketplaceModel.itemImages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("MarketplaceTableViewCell", owner: self, options: nil)?.first as! MarketplaceTableViewCell
        
        let image = UIImage(named: marketplaceModel.itemImages[indexPath.row])
        cell.itemImageView.image = image
        cell.itemDetailLabel.text = marketplaceModel.itemDetail[indexPath.row]
        cell.residentNameLabel.text = marketplaceModel.resident[indexPath.row]
        cell.itemPriceLabel.text = marketplaceModel.itemPrice[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}


// MARK: - MenuViewDelegate
extension MarketplaceTableViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if menu.selectedIndex == 0 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeID") as! HomeCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 1 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MensajeID") as! MensajesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 2 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ComunicadoID") as! ComunicadoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 3 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 4 {
            print("current controller, no segue needed")
        }
        
        tableView.reloadData()
    }
}



