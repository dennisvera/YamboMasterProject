//
//  Pago.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/22/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Pago {
    
    var transacciones: String
    var nuevoPago: String
    var hacerPago: String
    var subject: String
    var date: String
    var time: String
    var amount: String
    var index: Int
    var section: String
    
    init(transacciones: String, nuevoPago: String, hacerPago: String, subject: String, date: String, time: String, amount: String, index: Int, section: String) {
        self.transacciones = transacciones
        self.nuevoPago = nuevoPago
        self.hacerPago = hacerPago
        self.subject = subject
        self.date = date
        self.time = time
        self.amount = amount
        self.index = index
        self.section = section
    }
    
    convenience init(copying pago: Pago) {
        self.init(transacciones: pago.transacciones, nuevoPago: pago.nuevoPago, hacerPago: pago.hacerPago, subject: pago.subject, date: pago.date, time: pago.time, amount: pago.amount, index: pago.index, section: pago.section)
    }
}
