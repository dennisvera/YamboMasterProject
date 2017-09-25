//
//  MenuDataSourceX.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MenuDataSourceX {
    
    var menu: [Menu] = []
    
    var count: Int {
        return menu.count
    }
    
    init() {
        menu = loadMenuFromDisk()
    }
    
    // MARK: - Private
    
    fileprivate func loadMenuFromDisk() -> [Menu] {
        if let path = Bundle.main.path(forResource: "Menu", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var menuArray: [Menu] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let iconImage = dict["iconImage"] as! String
                        let index = dict["index"] as! Int
                        let section = dict["section"] as! String
                        let menu = Menu(name: name, iconImage: iconImage, index: index, section: section)
                        
                        menuArray.append(menu)
                    }
                }
                return menuArray
            }
        }
        return []
    }
}
