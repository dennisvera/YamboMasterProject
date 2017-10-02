//
//  InvitadoCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/1/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class InvitadoCell: UICollectionViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func prepareForReuse() {
        profileImageView.image = nil
        nameLabel.text = ""
    }
    
    var invitado: Invitado? {
        didSet {
            if let invitado = invitado {
                profileImageView.image = UIImage(named: invitado.photo)
                profileImageView.layer.cornerRadius = 10
                nameLabel.text = invitado.name
            }
        }
    }
}
