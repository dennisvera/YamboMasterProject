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
private let mensajeDetailSegueID = "MensajeDetailSegueID"

class MensajeTableViewController: UITableViewController {
    
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuModel = MenuDataSource()
    var filteredMensajes = [Mensaje]()
    fileprivate var mensajeDataSource = MensajeDataSource()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenuIcons()
        loadMenu()
        loadSearchController()
        loadNavigationBar()
        self.navigationItem.loadRightBarButtonItem()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        searchController.isActive = false
    }
    
    func loadNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .yamboBlue
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
        if isFiltering() {
            return filteredMensajes.count
        } else {
            return mensajeDataSource.numberOfMensajesInSection(section)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mensajeCellID, for: indexPath) as! MensajeCell
        
        let mensaje: Mensaje
        if isFiltering() {
            mensaje = filteredMensajes[indexPath.row]
            cell.mensaje = mensaje
        } else {
            if let mensaje = mensajeDataSource.mensajeForItemAtIndexPath(indexPath) {
                cell.mensaje = mensaje
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    // MARK: - SearchController + Instance Methods
    func loadSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Buscar"
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchBarStyle = UISearchBarStyle.prominent
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchBar.isTranslucent = false
        searchController.searchBar.backgroundImage = UIImage()
        
        self.definesPresentationContext = true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredMensajes = mensajeDataSource.mensaje.filter({( mensaje : Mensaje) -> Bool in
            let name = mensaje.name.lowercased()
            let date = mensaje.date.lowercased()
            let message = mensaje.message.lowercased()
            let doesSearchMatch = name + date + message
            return doesSearchMatch.contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == mensajeDetailSegueID {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let mensaje: Mensaje
                if isFiltering() {
                    mensaje = filteredMensajes[indexPath.row]
                } else {
                    mensaje = mensajeDataSource.mensajeForItemAtIndexPath(indexPath)!
                }
                
                let controller = segue.destination as! MensajeDetailViewController
                controller.mensaje = mensaje
            }
        }
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
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacioneTableViewController
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

extension MensajeTableViewController: UISearchResultsUpdating {
    
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}













