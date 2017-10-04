//
//  HomeCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/23/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet var menuBackgroundView: UIView!
    @IBOutlet var menuImageView: UIImageView!
    @IBOutlet var menuNameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    override func prepareForReuse() {
        menuNameLabel.text = ""
        numberLabel.text = ""
        menuImageView.image = nil
    }
    
    var home: Home? {
        didSet {
            if let home = home {
                menuNameLabel.text = home.menuTitle
                menuBackgroundView.layer.cornerRadius = 10
                menuImageView.image = UIImage(named: home.menuImage)
                
                if home.menuTitle == "MENSAJES" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .orange
                    numberLabel.text = "1"
                } else if home.menuTitle == "COMUNICADOS" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .aqua
                    numberLabel.text = "2"
                } else if home.menuTitle == "RESERVACIONES" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .silver
                    numberLabel.text = "\u{2713}"
                } else if home.menuTitle == "MARKETPLACE" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .silver
                    numberLabel.text = "\u{2713}"
                } else if home.menuTitle == "INVITADOS" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .silver
                    numberLabel.text = "\u{2713}"
                } else if home.menuTitle == "SOLICITUDES" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .aqua
                    numberLabel.text = "\u{2713}"
                } else if home.menuTitle == "PAGOS" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .silver
                    numberLabel.text = "\u{2713}"
                } else if home.menuTitle == "DIRECTORIO" {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .orange
                    numberLabel.text = "1"
                }
            }
        }
    }
    
}











