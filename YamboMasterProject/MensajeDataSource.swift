//
//  MensajeDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MensajeDataSource {
    
    fileprivate var mensaje: [Mensaje] = []
    fileprivate var sections: [String] = []
    
    var count: Int {
        return mensaje.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    // MARK: - Public
    
    init() {
        mensaje = loadMensajeFromDisk()
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        
        var newMensaje: [Mensaje] = []
        for (index, mensaje) in mensaje.enumerated() {
            if !indexes.contains(index) {
                newMensaje.append(mensaje)
            }
        }
        
        mensaje = newMensaje
    }
    
    func indexPathForInvitado(_ mensaje: Mensaje) -> IndexPath {
        let section = sections.index(of: mensaje.section)!
        var item = 0
        for (index, currentInvitado) in mensajesForSection(section).enumerated() {
            if currentInvitado === mensaje {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfMensajesInSection(_ index: Int) -> Int {
        let mensajes = mensajesForSection(index)
        return mensajes.count
    }
    
    func mensajeForItemAtIndexPath(_ indexPath: IndexPath) -> Mensaje? {
        if (indexPath as NSIndexPath).section > 0 {
            let mensaje = mensajesForSection((indexPath as NSIndexPath).section)
            return mensaje[(indexPath as NSIndexPath).item]
        } else {
            return mensaje[(indexPath as NSIndexPath).item]
        }
    }
    
    // MARK: - Private
    
    fileprivate func loadMensajeFromDisk() -> [Mensaje] {
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main.path(forResource: "Mensaje", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var mensajeArray: [Mensaje] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let image = dict["image"] as! String
                        let message = dict["message"] as! String
                        let date = dict["date"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let mensaje = Mensaje(name: name, image: image, message: message, date: date, index: index, section: section)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        mensajeArray.append(mensaje)
                    }
                }
                return mensajeArray
            }
        }
        return []
    }
    
    fileprivate func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<(indexPath as NSIndexPath).section {
            index += numberOfMensajesInSection(i)
        }
        index += (indexPath as NSIndexPath).item
        return index
    }
    
    fileprivate func mensajesForSection(_ index: Int) -> [Mensaje] {
        let section = sections[index]
        let mensajesInSection = mensaje.filter { (mensaje: Mensaje) -> Bool in
            return mensaje.section == section
        }
        return mensajesInSection
    }
}





