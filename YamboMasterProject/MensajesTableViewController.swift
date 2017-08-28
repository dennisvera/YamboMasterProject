//
//  MensajesTableViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MensajesTableViewController: UITableViewController {
    
    //    var mensajes = Mensaje()
    
    let profileImages = ["DCProfile.jpg", "DCProfile.jpg", "DCProfile.jpg", "DCProfile.jpg", "DCProfile.jpg", ]
    let names = ["Luis Alberto Ortega", "Genaro Perez", "Janis Dueñas", "Enerique Triverio", "Carlos Gama"]
    let messages = ["Puede estar listo hoy?", "Puede estar listo hoy?", "Puede estar listo hoy?", "Puede estar listo hoy?", "Puede estar listo hoy?"]
    let dates = ["hace 2hr", "ayer", "27/08/17", "05/07/187", "06/07/17"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("MensajesTableViewCell", owner: self, options: nil)?.first as! MensajesTableViewCell
        
        let image = UIImage(named: profileImages[indexPath.row])
        cell.imageView?.image = image
        cell.imageView?.layer.cornerRadius = (image?.size.width)!/2
        cell.imageView?.layer.masksToBounds = true
        
        cell.nameLabel.text = names[indexPath.row]
        cell.messageLabel.text = messages[indexPath.row]
        cell.dateLabel.text = dates[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}












