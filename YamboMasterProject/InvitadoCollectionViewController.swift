//
//  InvitadosCollectionViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/8/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let invitadoCellID = "InvitadoCellID"
private let invitadoAddCellID = "InvitadoAddCellID"

class InvitadoCollectionViewController: UICollectionViewController {
    fileprivate var invitadoDataSource = InvitadoDataSource()
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuDataSource = MenuDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenuIcons()
        loadMenu()
        refreshController()
        self.navigationItem.loadRightBarButtonItem()
        //        addButton()
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
    
    func refreshController() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(InvitadoCollectionViewController.refreshControlDidFire), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }
    
    @objc func refreshControlDidFire() {
        //        addButtonTapped(nil)
        collectionView?.refreshControl?.endRefreshing()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let indexPath = invitadoDataSource.indexPathForNewRandomPark()
        
        let layout = collectionViewLayout as! InvitadosViewFlowLayout
        layout.appearingIndexPath = indexPath
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.0, options: UIViewAnimationOptions(), animations: { () -> Void in
            
            self.collectionView!.insertItems(at: [indexPath as IndexPath])
        }, completion: { (finished: Bool) -> Void in
            layout.appearingIndexPath = nil
        })
        
        print("Button Clicked")
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return invitadoDataSource.numberOfInvitadosInSection(section)
        } else if section == 1 {
            return 1
        }
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: invitadoCellID, for: indexPath) as! InvitadoCell
            
            if let invitado = invitadoDataSource.invitadoForItemAtIndexPath(indexPath) {
                cell.invitado = invitado
            }
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: invitadoAddCellID, for: indexPath) as! InvitadoAddCell
//            cell.frame = CGRect(x: 20, y: 40, width: 80, height: 110)
            cell.nuevoInvitadoLabel.text = "Nuevo Invitado"
            
            return cell
        }
    }
}

// MARK: - MenuViewDelegate
extension InvitadoCollectionViewController: MenuViewDelegate {
    
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
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacioneTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 4 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketID") as! MarketTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 5 {
            print("current controller, no segue needed")
        } else if menu.selectedIndex == 6 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SolicitudeID") as! SolicitudCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }  else if menu.selectedIndex == 7 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PagoID") as! PagoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        collectionView?.reloadData()
    }
}







