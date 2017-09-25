//
//  MensajesTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let mensajeCellID = "MensajeCellID"

class MensajeTableViewController: UITableViewController {
    fileprivate var mensajeDataSource = MensajeDataSource()
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuModel = MenuDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadMenuIcons()
        loadMenu()
        self.navigationItem.loadRightBarButtonItem()
    }
    
    func loadMenuIcons() {
        for (IconName, name) in zip(menuModel.menuIcons, menuModel.menuNames) {
            menuItems.append(MenuItem(name: name, image: UIImage(named: IconName)))
        }
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
        return mensajeDataSource.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mensajeDataSource.numberOfMensajesInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mensajeCellID, for: indexPath) as! MensajeCell
        
        if let mensaje = mensajeDataSource.mensajeForItemAtIndexPath(indexPath) {
            cell.mensaje = mensaje
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

// MARK: - MenuViewDelegate
extension MensajeTableViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if menu.selectedIndex == 0 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeID") as! HomeCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 1 {
            print("current controller, no segue needed")
        } else if menu.selectedIndex == 2 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ComunicadoID") as! ComunicadoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 3 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 4 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketID") as! MarketTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 5 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "InvitadoID") as! InvitadoCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 6 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SolicitudeID") as! SolicitudCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }  else if menu.selectedIndex == 7 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PagoID") as! PagoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        tableView.reloadData()
    }
}











