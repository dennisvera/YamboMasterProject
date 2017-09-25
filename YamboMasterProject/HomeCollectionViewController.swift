//
//  HomePageCollectionViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/1/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let homeCellID = "HomeCellID"
private let homeHeaderViewID = "HomeHeaderViewID"

class HomeCollectionViewController: UICollectionViewController {
    fileprivate var homeDataSource = HomeDataSource()
    fileprivate var menuDataSourceX = MenuDataSourceX()
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuDataSource = MenuDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenuIcons()
        loadMenu()
        self.navigationItem.loadRightBarButtonItem()
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
        
        collectionView?.addSubview(menu)
    }
    
    // MARK: - Actions
    @IBAction fileprivate func switchMenu() {
        menu.setRevealed(!menu.revealed, animated: true)
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeDataSource.numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeDataSource.numberOfHomesInSection(section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: homeHeaderViewID, for: indexPath) as! HomeHeaderReusableView
        
        if let homeHeader = homeDataSource.homeForItemAtIndexPath(indexPath) {
             headerView.homeHeader = homeHeader
        }
        
        return headerView
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCellID, for: indexPath) as! HomeCell
        
        if let home = homeDataSource.homeForItemAtIndexPath(indexPath) {
            cell.home = home
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HomeCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if indexPath.row == 0 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MensajeID") as! MensajeTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 1 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ComunicadoID") as! ComunicadoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 2 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 3 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketID") as! MarketTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 4 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "InvitadoID") as! InvitadoCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 5 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SolicitudeID") as! SolicitudCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 6 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PagoID") as! PagoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

// MARK: - MenuViewDelegate
extension HomeCollectionViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if menu.selectedIndex == 0 {
            print("current controller, no segue needed")
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
        } else if menu.selectedIndex == 7 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PagoID") as! PagoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        
        collectionView?.reloadData()
    }
}




