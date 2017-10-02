//
//  ReservacioneDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/2/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ReservacioneDataSource {
    
    fileprivate var reservacione: [Reservacione] = []
    fileprivate var sections: [String] = []
    
    var count: Int {
        return reservacione.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        reservacione = loadReservacioneFromDisk()
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        
        var newReservacione: [Reservacione] = []
        for (index, reservacione) in reservacione.enumerated() {
            if !indexes.contains(index) {
                newReservacione.append(reservacione)
            }
        }
        
        reservacione = newReservacione
    }
    
    func indexPathForReservacione(_ reservacione: Reservacione) -> IndexPath {
        let section = sections.index(of: reservacione.section)!
        var item = 0
        for (index, currentReservacione) in reservacioneForSection(section).enumerated() {
            if currentReservacione === reservacione {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfReservacionesInSection(_ index: Int) -> Int {
        let reservacione = reservacioneForSection(index)
        return reservacione.count
    }
    
    func reservacioneForItemAtIndexPath(_ indexPath: IndexPath) -> Reservacione? {
        if (indexPath as NSIndexPath).section > 0 {
            let reservacione = reservacioneForSection((indexPath as NSIndexPath).section)
            return reservacione[(indexPath as NSIndexPath).item]
        } else {
            return reservacione[(indexPath as NSIndexPath).item]
        }
    }
    
    // MARK: - Private
    
    fileprivate func loadReservacioneFromDisk() -> [Reservacione] {
        if let path = Bundle.main.path(forResource: "Reservacione", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var reservacioneArray: [Reservacione] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let image = dict["image"] as! String
                        let title = dict["title"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let reservacione = Reservacione(image: image, title: title, index: index, section: section)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        reservacioneArray.append(reservacione)
                    }
                }
                return reservacioneArray
            }
        }
        return []
    }
    
    fileprivate func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<(indexPath as NSIndexPath).section {
            index += numberOfReservacionesInSection(i)
        }
        index += (indexPath as NSIndexPath).item
        return index
    }
    
    fileprivate func reservacioneForSection(_ index: Int) -> [Reservacione] {
        let section = sections[index]
        let reservacionesInSection = reservacione.filter { (reservacione: Reservacione) -> Bool in
            return reservacione.section == section
        }
        return reservacionesInSection
    }
}



