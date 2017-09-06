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
    var menuItems = [MenuItem]()
    var menuModel = MenuType()
    @IBOutlet var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(HomeHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HomeHeaderID")
        collectionView?.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuModel.homepageMenuNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeaderID", for: indexPath) as! HomeHeaderCollectionReusableView
        
        headerView.backgroundColor = .red
        headerView.dateLabel?.text = menuModel.headerDate[indexPath.row]
        return headerView
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let image = UIImage(named: menuModel.homepageMenuIcons[indexPath.row])
        cell.menuIconImageView.image = image
        cell.menuTitleLabel.text = menuModel.homepageMenuNames[indexPath.row]
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension HomeCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        if indexPath.row == 0 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MensajeID") as! MensajesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 1 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ComunicadoID") as! ComunicadoTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 2 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if indexPath.row == 3 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketplaceID") as! MarketplaceTableViewController
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
        
        collectionView?.reloadData()
    }
}
