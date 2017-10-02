//
//  PagoPendienteCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/21/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class PagoPendienteCell: UITableViewCell {
    
    @IBOutlet var hacerPagoLabel: UILabel!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    override func prepareForReuse() {
        hacerPagoLabel.text = ""
        subjectLabel.text = ""
        amountLabel.text = ""
    }
    
    var hacerPago: Pago? {
        didSet {
            if let hacerPago = hacerPago {
                hacerPagoLabel.layer.cornerRadius = 3
                hacerPagoLabel.text = hacerPago.hacerPago
                subjectLabel.text = hacerPago.subject
                amountLabel.text = hacerPago.amount
            }
        }
    }

}
