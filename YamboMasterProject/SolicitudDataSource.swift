//
//  SolicitudeDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/15/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class SolicitudDataSource {
    fileprivate var solicitud: [Solicitud] = []
    fileprivate var sections: [String] = []
    
    var count: Int {
        return solicitud.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    // MARK: - Public
    
    init() {
        solicitud = loadSolicitudeFromDisk()
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        var newSolicitude: [Solicitud] = []
        for (index, invitado) in solicitud.enumerated() {
            if !indexes.contains(index) {
                newSolicitude.append(invitado)
            }
        }
        solicitud = newSolicitude
    }
    
    func indexPathForSolicitude(_ solicitud: Solicitud) -> IndexPath {
        let section = sections.index(of: solicitud.section)!
        var item = 0
        for (index, currentInvitado) in solicitudeForSection(section).enumerated() {
            if currentInvitado === solicitud {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfSolicitudesInSection(_ index: Int) -> Int {
        let solicitud = solicitudeForSection(index)
        return solicitud.count
    }
    
    func solicitudeForItemAtIndexPath(_ indexPath: IndexPath) -> Solicitud? {
        if (indexPath as NSIndexPath).section > 0 {
            let solicitud = solicitudeForSection((indexPath as NSIndexPath).section)
            return solicitud[(indexPath as NSIndexPath).item]
        } else {
            return solicitud[(indexPath as NSIndexPath).item]
        }
    }
    
    // MARK: - Private
    
    fileprivate func loadSolicitudeFromDisk() -> [Solicitud] {
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main.path(forResource: "Solicitud", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var solicitudesArray: [Solicitud] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let atendida = dict["atendida"] as! String
                        let solicitud = dict["solicitude"] as! String
                        let solicitudNote = dict["solicitudNote"] as! String
                        let mensaje = dict["mensaje"] as! String
                        let mensajeNote = dict["mensajeNote"] as! String
                        let fecha = dict["fecha"] as! String
                        let fechaNote = dict["fechaNote"] as! String
                        let atendio = dict["atendio"] as! String
                        let atendioNote = dict["atendioNote"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let solicitudInit = Solicitud(atendida: atendida, solicitud: solicitud, solicitudNote: solicitudNote, mensaje: mensaje, mensajeNote: mensajeNote, fecha: fecha, fechaNote: fechaNote, atendio: atendio, atendioNote: atendioNote, index: index, section: section)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        solicitudesArray.append(solicitudInit)
                    }
                }
                return solicitudesArray
            }
        }
        return []
    }
    
    fileprivate func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<(indexPath as NSIndexPath).section {
            index += numberOfSolicitudesInSection(i)
        }
        index += (indexPath as NSIndexPath).item
        return index
    }
    
    fileprivate func solicitudeForSection(_ index: Int) -> [Solicitud] {
        let section = sections[index]
        let solicitudeInSection = solicitud.filter { (solicitude: Solicitud) -> Bool in
            return solicitude.section == section
        }
        return solicitudeInSection
    }
    
}
