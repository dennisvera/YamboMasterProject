//
//  ComunicadoTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/28/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

class ComunicadoTableViewController: UITableViewController {
    fileprivate var menu: MenuView!
    
    var subjects = ["Reparaciones en el piso 17 de la torre D", "Curso gratuito para todo los niños", "Se cerrarán las canchas de tenis por dos dias", "Inauguracion de la nueva torre en el Salón De Fiestas", "Classes de spinning por impartirseen el residential"]
    var userName = ["Luis Alberto Ortega — hace dos dias", "Luis Alberto Ortega — hace dos dias", "Luis Alberto Ortega – hace dos dias", "Luis Alberto Ortega – hace dos dias", "Luis Alberto Ortega – hace dos dias"]
    var images = ["comunicado1.jpg", "comunicado2.jpg", "comunicado3.jpg", "comunicado4.png", "comunicado4.png"]
    
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
    fileprivate let items = (0..<9).map {
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
        return subjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("CommunicadosTableViewCell", owner: self, options: nil)?.first as! CommunicadosTableViewCell
        
        let image = UIImage(named: images[indexPath.row])
        cell.comunicadoImage.image = image
        cell.subjectLabel.text = subjects[indexPath.row]
        cell.userNameLabel.text = userName[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

// MARK: - MenuViewDelegate
extension ComunicadoTableViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if menu.selectedIndex == 0 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeID") as! HomeCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 1 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MensajeID") as! MensajesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 2 {
            print("current controller, no segue needed")
        } else if menu.selectedIndex == 3 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 4 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketplaceID") as! MarketplaceTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}





