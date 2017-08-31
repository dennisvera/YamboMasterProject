//
//  MensajesTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

class MensajesTableViewController: UITableViewController {
    fileprivate var menu: MenuView!
    
    let profileImages = ["cara.jpg", "patola.jpg", "cara.jpg", "patola.jpg", "cara.jpg"]
    let names = ["Luis Alberto Ortega", "Genaro Perez", "Janis Dueñas", "Enerique Triverio", "Carlos Gama"]
    let messages = ["Puede estar listo hoy?", "Puede estar listo hoy?", "Puede estar listo hoy?", "Puede estar listo hoy?", "Puede estar listo hoy?"]
    let dates = ["hace 2hr", "ayer", "27/08/17", "05/07/187", "06/07/17"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenu()
    }
    
    fileprivate func loadMenu() {
        menu = {
            let menu = MenuView()
            menu.delegate = self
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
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("MensajesTableViewCell", owner: self, options: nil)?.first as! MensajesTableViewCell
        
        let image = UIImage(named: profileImages[indexPath.row])
        cell.imageView?.image = image
        cell.imageView?.layer.cornerRadius = (image?.size.width)!/2
        cell.imageView?.layer.masksToBounds = true
        
        cell.nameLabel.text = names[indexPath.row]
        cell.messageLabel.text = messages[indexPath.row]
        cell.dateLabel.text = dates[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
    }
}

// MARK: - MenuViewDelegate
extension MensajesTableViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        if menu.selectedIndex == 0 {
            navigationItem.title = ""
        } else if menu.selectedIndex == 1 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ComunicadoID") as! ComunicadoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            navigationItem.title = ""
        } else if menu.selectedIndex == 2 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacionesID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            navigationItem.title = ""
        } else if menu.selectedIndex == 3 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketplaceID") as! MarketplaceTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            navigationItem.title = ""
        }
    }
}











