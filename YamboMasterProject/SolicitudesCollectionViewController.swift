//
//  SolicitudesCollectionViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/6/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let reuseIdentifier2 = "SolicitudeCollectionViewCell2"

class SolicitudesCollectionViewController: UICollectionViewController {
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuModel = MenuType()
    var dataSource = SolicitudeType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        collectionView?.register(UINib(nibName: "SolicitudesCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier2)
        
        for (IconName, name) in zip(menuModel.menuIcons, menuModel.menuNames) {
            menuItems.append(MenuItem(name: name, image: UIImage(named: IconName)))
        }
        
        loadMenu()
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
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.atendida.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath) as! SolicitudesCollectionViewCell2
        
        cell.atendidaLabel.text = dataSource.atendida[indexPath.row]
        cell.solicitudLabel.text = dataSource.solicitud[indexPath.row]
        cell.solicitudNoteLabel.text = dataSource.solicitudNote[indexPath.row]
        cell.mensajeLabel.text = dataSource.mensaje[indexPath.row]
        cell.mensajeNoteLabel.text = dataSource.mensajeNote[indexPath.row]
        cell.fechaLabel.text = dataSource.fecha[indexPath.row]
        cell.fechaNoteLabel.text = dataSource.FechaNote[indexPath.row]
        cell.atendidoLabel.text = dataSource.atendio[indexPath.row]
        cell.atendidoNoteLabel.text = dataSource.atendioNote[indexPath.row]
        return cell
    }
}


// MARK: - MenuViewDelegate
extension SolicitudesCollectionViewController: MenuViewDelegate {
    
    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if menu.selectedIndex == 0 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeID") as! HomeCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
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
        } else if menu.selectedIndex == 5 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "InvitadoID") as! InvitadoCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 6 {
            print("current controller, no segue needed")
        }
        
        collectionView?.reloadData()
    }
}






