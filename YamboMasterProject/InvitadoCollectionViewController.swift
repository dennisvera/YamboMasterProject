//
//  InvitadosCollectionViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/8/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import Persei

private let reuseIdentifier = "InvitadoCell"

class InvitadoCollectionViewController: UICollectionViewController {
    fileprivate var invitadoDataSource = InvitadoDataSource()
    fileprivate var menu: MenuView!
    var menuItems = [MenuItem]()
    var menuModel = MenuType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        collectionView?.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        for (IconName, name) in zip(menuModel.menuIcons, menuModel.menuNames) {
            menuItems.append(MenuItem(name: name, image: UIImage(named: IconName)))
        }
        
        loadMenu()
        refreshController()
        addButton()
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
    
    func refreshControlDidFire() {
//        addButtonTapped(nil)
        collectionView?.refreshControl?.endRefreshing()
    }
    
    fileprivate func addButton(){
        let button = UIButton(type: .custom) as UIButton
        button.backgroundColor = UIColor(red: 40/255, green: 45/255, blue: 84/255, alpha: 1)
        button.setImage(#imageLiteral(resourceName: "plusIcon"), for: .normal)
        button.frame = CGRect(x: 147, y: 340, width: 80, height: 80)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(addButtonTappedAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func addButtonTappedAction(sender: UIButton!) {
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
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem?) {
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return invitadoDataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InvitadoCell
        
        if let invitado = invitadoDataSource.invitadoForItemAtIndexPath(indexPath) {
            cell.invitado = invitado
        }
        return cell
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
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReservacioneID") as! ReservacionesTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 4 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketplaceID") as! MarketplaceTableViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else if menu.selectedIndex == 5 {
            print("current controller, no segue needed")
        } else if menu.selectedIndex == 6 {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SolicitudeID") as! SolicitudeCollectionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        collectionView?.reloadData()
    }
}







