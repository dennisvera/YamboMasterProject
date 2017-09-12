//
//  InvitadoDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/12/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class InvitadosDataSource {
    fileprivate var invitados: [Invitado] = []
    fileprivate var immutableInvitados: [Invitado] = []
    fileprivate var sections: [String] = []
    
    var count: Int {
        return invitados.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    // MARK: - Public
    
    init() {
        invitados = loadInvitadoFromDisk()
        immutableInvitados = invitados
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        var newInvitado: [Invitado] = []
        for (index, invitado) in invitados.enumerated() {
            if !indexes.contains(index) {
                newInvitado.append(invitado)
            }
        }
        invitados = newInvitado
    }
    
    func indexPathForNewRandomPark() -> IndexPath {
        let index = Int(arc4random_uniform(UInt32(immutableInvitados.count)))
        let parkToCopy = immutableInvitados[index]
        let newPark = Invitado(copying: parkToCopy)
        invitados.append(newPark)
        invitados.sort { $0.index < $1.index }
        return indexPathForInvitado(newPark)
    }
    
    func indexPathForInvitado(_ invitado: Invitado) -> IndexPath {
        let section = sections.index(of: invitado.section)!
        var item = 0
        for (index, currentInvitado) in invitadosForSection(section).enumerated() {
            if currentInvitado === invitado {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfInvitadosInSection(_ index: Int) -> Int {
        let invitados = invitadosForSection(index)
        return invitados.count
    }
    
    func invitadoForItemAtIndexPath(_ indexPath: IndexPath) -> Invitado? {
        if (indexPath as NSIndexPath).section > 0 {
            let invitado = invitadosForSection((indexPath as NSIndexPath).section)
            return invitado[(indexPath as NSIndexPath).item]
        } else {
            return invitados[(indexPath as NSIndexPath).item]
        }
    }
    
    // MARK: - Private
    
    fileprivate func loadInvitadoFromDisk() -> [Invitado] {
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main.path(forResource: "Invitado", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var invitadoArray: [Invitado] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let photo = dict["photo"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let invitado = Invitado(name: name, photo: photo, index: index, section: section)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        invitadoArray.append(invitado)
                    }
                }
                return invitadoArray
            }
        }
        return []
    }
    
    fileprivate func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<(indexPath as NSIndexPath).section {
            index += numberOfInvitadosInSection(i)
        }
        index += (indexPath as NSIndexPath).item
        return index
    }
    
    fileprivate func invitadosForSection(_ index: Int) -> [Invitado] {
        let section = sections[index]
        let invitadoInSection = invitados.filter { (invitado: Invitado) -> Bool in
            return invitado.section == section
        }
        return invitadoInSection
    }
    
}













