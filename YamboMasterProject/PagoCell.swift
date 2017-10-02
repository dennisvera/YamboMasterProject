//
//  PagoCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/22/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class PagoCell: UITableViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    override func prepareForReuse() {
        dateLabel.text = ""
        timeLabel.text = ""
        subjectLabel.text = ""
        amountLabel.text = ""
    }
    
    var pago: Pago? {
        didSet {
            if let pago = pago {
                dateLabel.text = pago.date
                timeLabel.text = pago.time
                subjectLabel.text = pago.subject
                amountLabel.text = pago.amount
            }
        }
    }

}
