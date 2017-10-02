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
    
    override func prepareForReuse() {
        transaccionesLabel.text = ""
        nuevoPagoLabel.text = ""
    }
    
    var pagoHeader: Pago? {
        didSet {
            if let pagoHeader = pagoHeader {
                transaccionesLabel.text = pagoHeader.transacciones
                nuevoPagoLabel.layer.cornerRadius = 3
                nuevoPagoLabel.text = pagoHeader.nuevoPago
            }
        }
    }
    
}
