//
//  MensajeDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/26/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MensajeDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    var mensaje: Mensaje?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMensajeDetailView()
        self.navigationItem.loadRightBarButtonItem()
    }
    
    func loadMensajeDetailView() {
        guard let name = mensaje?.name else {return}
        nameLabel.text = name
        guard let image = mensaje?.image else {return}
        profileImageView.image = UIImage(named: image)
        title = "MENSAJE"
    }
    
}
