//
//  InvitadoCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/11/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class InvitadoCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        profileImageView.image = nil
        nameLabel.text = ""
    }
    
//    var invitado: InvitadoType? {
//        didSet {
//            if let nationalPark = invitado {
//                profileImageView.image = UIImage(named: nationalPark.photo)
//                nameLabel.text = nationalPark.photo
//            }
//        }
//    }
    
}
