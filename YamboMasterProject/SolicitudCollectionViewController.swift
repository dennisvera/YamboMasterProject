//
//  SolicitudesCollectionViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/6/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let solicitudCellID = "SolicitudCellID"
private let solicitudSegmentCellID = "SolicitudSegmentCellID"

class SolicitudCollectionViewController: UICollectionViewController {
    fileprivate var solicitudDataSource = SolicitudDataSource()
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuModel = MenuType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenuIcons()
        loadMenu()
        refreshController()
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
        
        collectionView?.addSubview(menu)
    }
    
    // MARK: - Actions
    @IBAction fileprivate func switchMenu() {
        menu.setRevealed(!menu.revealed, animated: true)
    }
    
    func refreshController() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(SolicitudCollectionViewController.refreshControlDidFire), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }
    
    func refreshControlDidFire() {
        collectionView?.refreshControl?.endRefreshing()
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return solicitudDataSource.count
        } else if section == 1 {
            return 1
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: solicitudCellID, for: indexPath) as! SolicitudCell
            
            if let solicitud = solicitudDataSource.solicitudeForItemAtIndexPath(indexPath) {
                cell.solicitud = solicitud
            }
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: solicitudSegmentCellID, for: indexPath) as! SolicitudSegmentCell
            cell.solicitudLabel.text = "DONUT"
            return cell
        }
    }
}


// MARK: - MenuViewDelegate
extension SolicitudCollectionViewController: MenuViewDelegate {
    
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
            print("current controller, no segue needed")
        }
        
        collectionView?.reloadData()
    }
}






