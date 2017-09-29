//
//  ComunicadoDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/28/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ComunicadoDataSource {
    
    var comunicado: [Comunicado] = []
    fileprivate var sections: [String] = []
    
    var count: Int {
        return comunicado.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    // MARK: - Public
    
    init() {
        comunicado = loadComunicadoFromDisk()
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        
        var newComunicado: [Comunicado] = []
        for (index, comunicado) in comunicado.enumerated() {
            if !indexes.contains(index) {
                newComunicado.append(comunicado)
            }
        }
        
        comunicado = newComunicado
    }
    
    func indexPathForComunicado(_ comunicado: Comunicado) -> IndexPath {
        let section = sections.index(of: comunicado.section)!
        var item = 0
        for (index, currentComunicado) in comunicadoForSection(section).enumerated() {
            if currentComunicado === comunicado {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfComunicadosInSection(_ index: Int) -> Int {
        let comunicado = comunicadoForSection(index)
        return comunicado.count
    }
    
    func comunicadoForItemAtIndexPath(_ indexPath: IndexPath) -> Comunicado? {
        if (indexPath as NSIndexPath).section > 0 {
            let comunicado = comunicadoForSection((indexPath as NSIndexPath).section)
            return comunicado[(indexPath as NSIndexPath).item]
        } else {
            return comunicado[(indexPath as NSIndexPath).item]
        }
    }
    
    // MARK: - Private
    
    fileprivate func loadComunicadoFromDisk() -> [Comunicado] {
        if let path = Bundle.main.path(forResource: "Comunicado", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var comunicadoArray: [Comunicado] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let subject = dict["subject"] as! String
                        let message = dict["message"] as! String
                        let date = dict["date"] as! String
                        let time = dict["time"] as! String
                        let image = dict["image"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let comunicado = Comunicado(name: name, subject: subject, message: message, date: date, time: time, image: image, index: index, section: section)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        comunicadoArray.append(comunicado)
                    }
                }
                return comunicadoArray
            }
        }
        return []
    }
    
    fileprivate func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<(indexPath as NSIndexPath).section {
            index += numberOfComunicadosInSection(i)
        }
        index += (indexPath as NSIndexPath).item
        return index
    }
    
    fileprivate func comunicadoForSection(_ index: Int) -> [Comunicado] {
        let section = sections[index]
        let comunicadosInSection = comunicado.filter { (comunicado: Comunicado) -> Bool in
            return comunicado.section == section
        }
        return comunicadosInSection
    }
}
