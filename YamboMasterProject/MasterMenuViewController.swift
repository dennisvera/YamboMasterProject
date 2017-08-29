//
//  MasterMenuViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/28/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

class MasterMenuTableViewController: UITableViewController {
    @IBOutlet var masterView: UIView!
    fileprivate var menu: MenuView!
    
    var titleNameArray: [String] = ["Mensajes", "Calendario", "Reservaciones", "Acciones", "Cobros Y Pagos", "Solicitudes"]
    var photoNameArray: [String] = ["mensajes.png", "calendario.png", "acciones.png", "acciones.png", "yamboLogo.png", "heart.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenu()
        
        title = titleNameArray[0]
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
    fileprivate let items = (0..<6).map {
        MenuItem(title: "Reservaciones", image: UIImage(named: "menu_icon_\($0)")!)
    }
    
    // MARK: - Actions
    @IBAction fileprivate func switchMenu() {
        menu.setRevealed(!menu.revealed, animated: true)
    }
    
    
}

// MARK: - MenuViewDelegate
extension MasterMenuTableViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
//        imageView.image = UIImage(named: photoNameArray[index])
        title = titleNameArray[index]
        
        if menu.selectedIndex == 0 {
            self.performSegue(withIdentifier: "MensajesSegue", sender: self)
            navigationItem.title = ""
        } else if menu.selectedIndex == 1 {
            self.performSegue(withIdentifier: "ComunicadosSegue", sender: self)
            navigationItem.title = ""
        } else if menu.selectedIndex == 2 {
            self.performSegue(withIdentifier: "ReservacionesSegue", sender: self)
            navigationItem.title = ""
        }
    }
}
