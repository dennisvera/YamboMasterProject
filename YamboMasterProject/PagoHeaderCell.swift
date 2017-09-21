//
//  PagoHeaderCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/21/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class PagoHeaderCell: UITableViewCell {
    @IBOutlet var transaccionesLabel: UILabel!
    @IBOutlet var nuevoPagoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nuevoPagoLabel.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        nuevoPagoLabel.layer.cornerRadius = 10
    }

}
