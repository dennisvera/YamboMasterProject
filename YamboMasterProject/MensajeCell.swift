//
//  MensajeCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MensajeCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
        nameLabel.text = ""
        messageLabel.text = ""
        dateLabel.text = ""
    }
    
    var mensaje: Mensaje? {
        didSet {
            if let mensaje = mensaje {
                profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
                profileImageView.image = UIImage(named: mensaje.image)
                nameLabel.text = mensaje.name
                messageLabel.text = mensaje.message
                dateLabel.text = mensaje.date
            }
        }
    }

}
