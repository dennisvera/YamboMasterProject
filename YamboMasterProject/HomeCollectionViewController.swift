//
//  HomePageCollectionViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/1/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

class HomeCollectionViewController: UICollectionViewController {
    fileprivate var menu: MenuView!
    
    let menuNames = ["MENSAJES", "COMUNICADOS", "RESERVACIONES", "MARKETPLACE", "INVITADOS", "SOLICITUDES", "PAGOS", "DIRECTORIO"]
    let menuIcons = ["menu_icon_1", "menu_icon_2", "menu_icon_3", "menu_icon_4", "menu_icon_5", "menu_icon_6", "menu_icon_7", "menu_icon_8"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let width = collectionView!.frame.width / 2
//        let layout = collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: width, height: width)
                
        collectionView?.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")

        loadMenu()
    }
    
    fileprivate func loadMenu() {
        menu = {
            let menu = MenuView()
            menu.delegate = self
            menu.items = items
            return menu
        }()
        
        collectionView?.addSubview(menu)
    }
    
    
    // MARK: - Items
    fileprivate let items = (0..<9).map {
        MenuItem(title: "Reservaciones", image: UIImage(named: "menu_icon_\($0)")!)
    }
    
    // MARK: - Actions
    @IBAction fileprivate func switchMenu() {
        menu.setRevealed(!menu.revealed, animated: true)
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let image = UIImage(named: menuIcons[indexPath.row])
        cell.menuIconImageView.image = image
        cell.menuTitleLabel.text = menuNames[indexPath.row]
    
        return cell
    }
    

}

// MARK: - MenuViewDelegate
extension HomeCollectionViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if menu.selectedIndex == 0 {
            print("")
        } else if menu.selectedIndex == 1 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MensajeID") as! MensajesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 2 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ComunicadoID") as! ComunicadoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 3 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 4 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketplaceID") as! MarketplaceTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
