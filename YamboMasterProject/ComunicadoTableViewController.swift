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
