//
//  SolicitudeDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/15/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class SolicitudeDataSource {
    fileprivate var solicitude: [Solicitude] = []
    fileprivate var sections: [String] = []
    
    var count: Int {
        return solicitude.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    // MARK: - Public
    
    init() {
        solicitude = loadSolicitudeFromDisk()
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        var newSolicitude: [Solicitude] = []
        for (index, invitado) in solicitude.enumerated() {
            if !indexes.contains(index) {
                newSolicitude.append(invitado)
            }
        }
        solicitude = newSolicitude
    }
    
    func indexPathForSolicitude(_ solicitude: Solicitude) -> IndexPath {
        let section = sections.index(of: solicitude.section)!
        var item = 0
        for (index, currentInvitado) in solicitudeForSection(section).enumerated() {
            if currentInvitado === solicitude {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfSolicitudesInSection(_ index: Int) -> Int {
        let solicitude = solicitudeForSection(index)
        return solicitude.count
    }
    
    func solicitudeForItemAtIndexPath(_ indexPath: IndexPath) -> Solicitude? {
        if (indexPath as NSIndexPath).section > 0 {
            let solicitude = solicitudeForSection((indexPath as NSIndexPath).section)
            return solicitude[(indexPath as NSIndexPath).item]
        } else {
            return solicitude[(indexPath as NSIndexPath).item]
        }
    }
    
    // MARK: - Private
    
    fileprivate func loadSolicitudeFromDisk() -> [Solicitude] {
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main.path(forResource: "Solicitude", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var solicitudeArray: [Solicitude] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let atendida = dict["atendida"] as! String
                        let solicitude = dict["solicitude"] as! String
                        let solicitudNote = dict["solicitudNote"] as! String
                        let mensaje = dict["mensaje"] as! String
                        let mensajeNote = dict["mensajeNote"] as! String
                        let fecha = dict["fecha"] as! String
                        let fechaNote = dict["fechaNote"] as! String
                        let atendio = dict["atendio"] as! String
                        let atendioNote = dict["atendioNote"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let solicitudeInit = Solicitude(atendida: atendida, solicitude: solicitude, solicitudNote: solicitudNote, mensaje: mensaje, mensajeNote: mensajeNote, fecha: fecha, fechaNote: fechaNote, atendio: atendio, atendioNote: atendioNote, index: index, section: section)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        solicitudeArray.append(solicitudeInit)
                    }
                }
                return solicitudeArray
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
    
    fileprivate func solicitudeForSection(_ index: Int) -> [Solicitude] {
        let section = sections[index]
        let solicitudeInSection = solicitude.filter { (solicitude: Solicitude) -> Bool in
            return solicitude.section == section
        }
        return solicitudeInSection
    }
    
}
