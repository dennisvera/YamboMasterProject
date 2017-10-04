//
//  HomeDataSource.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/23/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeDataSource {
    
    fileprivate var home: [Home] = []
    fileprivate var sections: [String] = []
    
    var count: Int {
        return home.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        home = loadHomeFromDisk()
    }
    
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        var indexes: [Int] = []
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        
        var newHome: [Home] = []
        for (index, home) in home.enumerated() {
            if !indexes.contains(index) {
                newHome.append(home)
            }
        }
        
        home = newHome
    }
    
    func indexPathForHome(_ home: Home) -> IndexPath {
        let section = sections.index(of: home.section)!
        var item = 0
        for (index, currentHome) in homeForSection(section).enumerated() {
            if currentHome === home {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    func numberOfHomesInSection(_ index: Int) -> Int {
        let home = homeForSection(index)
        return home.count
    }
    
    func homeForItemAtIndexPath(_ indexPath: IndexPath) -> Home? {
        if (indexPath as NSIndexPath).section > 0 {
            let home = homeForSection((indexPath as NSIndexPath).section)
            return home[(indexPath as NSIndexPath).item]
        } else {
            return home[(indexPath as NSIndexPath).item]
        }
    }
    
    // MARK: - Private
    
    fileprivate func loadHomeFromDisk() -> [Home] {
        if let path = Bundle.main.path(forResource: "Home", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var homeArray: [Home] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let day = dict["day"] as! String
                        let date = dict["date"] as! String
                        let verCalendario = dict["verCalendario"] as! String
                        let menuImage = dict["menuImage"] as! String
                        let menuTitle = dict["menuTitle"] as! String
                        let logo = dict["logo"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let home = Home(day: day, date: date, verCalendario: verCalendario, menuImage: menuImage, menuTitle: menuTitle, logo: logo, index: index, section: section)
                        if !sections.contains(section) {
                            sections.append(section)
                        }
                        homeArray.append(home)
                    }
                }
                return homeArray
            }
        }
        return []
    }
    
    fileprivate func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<(indexPath as NSIndexPath).section {
            index += numberOfHomesInSection(i)
        }
        index += (indexPath as NSIndexPath).item
        return index
    }
    
    fileprivate func homeForSection(_ index: Int) -> [Home] {
        let section = sections[index]
        let homesInSection = home.filter { (home: Home) -> Bool in
            return home.section == section
        }
        return homesInSection
    }
    
}
