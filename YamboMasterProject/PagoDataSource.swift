//
//  PagoDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/22/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class PagoDataSource {
    
    fileprivate var pago: [Pago] = []
    
    var count: Int {
        return pago.count
    }
    
    init() {
        pago = loadPagoFromDisk()
    }
    
    func pagoForItemAtIndexPath(_ indexPath: IndexPath) -> Pago? {
        return pago[(indexPath as NSIndexPath).item]
    }
    
    // MARK: - Private
    
    fileprivate func loadPagoFromDisk() -> [Pago] {
        if let path = Bundle.main.path(forResource: "Pago", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var pagoArray: [Pago] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let transacciones = dict["transacciones"] as! String
                        let nuevoPago = dict["nuevoPago"] as! String
                        let hacerPago = dict["hacerPago"] as! String
                        let subject = dict["subject"] as! String
                        let date = dict["date"] as! String
                        let time = dict["time"] as! String
                        let amount = dict["amount"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let pago = Pago(transacciones: transacciones, nuevoPago: nuevoPago, hacerPago: hacerPago, subject: subject, date: date, time: time, amount: amount, index: index, section: section)
                        
                        pagoArray.append(pago)
                    }
                }
                return pagoArray
            }
        }
        return []
    }
    
}
