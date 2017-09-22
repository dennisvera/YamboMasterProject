//
//  PagoTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/21/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let pagoHeaderCellID = "PagoHeaderCellID"
private let pagoPendienteCellID = "PagoPendienteCellID"
private let pagoCellID = "PagoCellID"

class PagoTableViewController: UITableViewController {
    fileprivate var pagoDataSource = PagoDataSource()
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuModel = MenuType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenuIcons()
        loadMenu()
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 104
            
        } else {
            return 64
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: pagoHeaderCellID, for: indexPath) as! PagoHeaderCell
            
            if let pagoHeader = pagoDataSource.pagoForItemAtIndexPath(indexPath) {
                cell.pagoHeader = pagoHeader
            }
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: pagoPendienteCellID, for: indexPath) as! PagoPendienteCell
            
            if let hacerPago = pagoDataSource.pagoForItemAtIndexPath(indexPath) {
                cell.hacerPagoLabel.layer.cornerRadius = 10
                cell.hacerPago = hacerPago
            }
            return cell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: pagoCellID, for: indexPath) as! PagoCell
            
            if let pago = pagoDataSource.pagoForItemAtIndexPath(indexPath) {
                cell.pago = pago
            }
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            return cell
        }
    }
    
}

// MARK: - MenuViewDelegate
extension PagoTableViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if menu.selectedIndex == 0 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeID") as! HomeCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 1 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MensajeID") as! MensajeTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
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
            print("current controller, no segue needed")
        }
        
        tableView.reloadData()
    }
}















