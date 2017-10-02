//
//  ReservacionesCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/2/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ReservacioneCell: UITableViewCell {
    
    @IBOutlet var bckgdImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func prepareForReuse() {
        bckgdImageView.image = nil
        titleLabel.text = ""
    }
    
    var reservacione: Reservacione? {
        didSet {
            if let reservacione = reservacione {
                bckgdImageView.image = UIImage(named: reservacione.image)
                titleLabel.text = reservacione.title
            }
        }
    }
    
}
