//
//  ComunicadoTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/28/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let comunicadoCellID = "ComunicadoCellID"
private let comunicadoDetailSegueID = "ComunicadoDetailSegueID"

class ComunicadoTableViewController: UITableViewController {
    
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuDataSource = MenuDataSource()
    var filteredComunicados = [Comunicado]()
    fileprivate var comunicadoDataSource = ComunicadoDataSource()
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
        for (IconName, name) in zip(menuDataSource.menuIcons, menuDataSource.menuNames) {
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
        return comunicadoDataSource.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredComunicados.count
        } else {
            return comunicadoDataSource.numberOfComunicadosInSection(section)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: comunicadoCellID, for: indexPath) as! ComunicadoCell
        
        let comunicado: Comunicado
        if isFiltering() {
            comunicado = filteredComunicados[indexPath.row]
            cell.comunicado = comunicado
        } else {
            if let comunicado = comunicadoDataSource.comunicadoForItemAtIndexPath(indexPath) {
                cell.comunicado = comunicado
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
        filteredComunicados = comunicadoDataSource.comunicado.filter({( comunicado : Comunicado) -> Bool in
            let name = comunicado.name.lowercased()
            let subject = comunicado.subject.lowercased()
            let doesSearchMatch = name + subject
            return doesSearchMatch.contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == comunicadoDetailSegueID,
            let detailViewController = segue.destination as? ComunicadoDetailViewController,
            let indexPath = self.tableView.indexPathForSelectedRow {
            let comunicado = comunicadoDataSource.comunicadoForItemAtIndexPath(indexPath)
            detailViewController.comunicado = comunicado
        }
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
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MensajeID") as! MensajeTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 2 {
            print("current controller, no segue needed")
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

extension ComunicadoTableViewController: UISearchResultsUpdating {
    
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}





