//
//  InvitadoAddCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/1/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class InvitadoAddCell: UICollectionViewCell {
    
    @IBOutlet var buttonBackgroundView: UIView!
    @IBOutlet var nuevoInvitadoLabel: UILabel!
    
    fileprivate var invitadoDataSource = InvitadoDataSource()
    
    override func prepareForReuse() {
        nuevoInvitadoLabel.text = ""
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        buttonBackgroundView.layer.cornerRadius = 5
    }
    
}
