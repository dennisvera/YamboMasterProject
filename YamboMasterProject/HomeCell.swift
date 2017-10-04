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
    
    enum menu: String {
        case mensaje = "MENSAJE"
        case comunicado = "COMUNICADO"
        case reservacione = "RESERVACIONES"
    }
    
    var home: Home? {
        didSet {
            if let home = home {
                menuNameLabel.text = home.menuTitle
                menuBackgroundView.layer.cornerRadius = 10
                menuImageView.image = UIImage(named: home.menuImage)
                
                if home.menuTitle.contains("\(menu.mensaje)") {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .orange
                    numberLabel.text = "1"
                } else if home.menuTitle.contains("\(menu.comunicado)") {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .aqua
                    numberLabel.text = "2"
                } else if home.menuTitle.contains("\(menu.reservacione)") {
                    numberLabel.setRoundEdge()
                    numberLabel.backgroundColor = .red
                    numberLabel.text = "\u{1F50A}"
                }
            }
        }
    }
    
}
