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
    fileprivate var sections: [String] = []
    
    var count: Int {
        return pago.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        pago = loadPagoFromDisk()
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        
        var newPago: [Pago] = []
        for (index, invitado) in pago.enumerated() {
            if !indexes.contains(index) {
                newPago.append(invitado)
            }
        }
        pago = newPago
    }
    
    func indexPathForPago(_ pago: Pago) -> IndexPath {
        let section = sections.index(of: pago.section)!
        var item = 0
        for (index, currentInvitado) in pagoForSection(section).enumerated() {
            if currentInvitado === pago {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfPagosInSection(_ index: Int) -> Int {
        let pago = pagoForSection(index)
        return pago.count
    }
    
    func pagoForItemAtIndexPath(_ indexPath: IndexPath) -> Pago? {
        if (indexPath as NSIndexPath).section > 0 {
            let pago = pagoForSection((indexPath as NSIndexPath).section)
            return pago[(indexPath as NSIndexPath).item]
        } else {
            return pago[(indexPath as NSIndexPath).item]
        }
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
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        pagoArray.append(pago)
                    }
                }
                return pagoArray
            }
        }
        return []
    }
    
    fileprivate func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<(indexPath as NSIndexPath).section {
            index += numberOfPagosInSection(i)
        }
        index += (indexPath as NSIndexPath).item
        return index
    }
    
    fileprivate func pagoForSection(_ index: Int) -> [Pago] {
        let section = sections[index]
        let pagosInSection = pago.filter { (pago: Pago) -> Bool in
            return pago.section == section
        }
        return pagosInSection
    }
}








