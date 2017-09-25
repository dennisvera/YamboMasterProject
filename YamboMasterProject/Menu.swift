//
//  Menu.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Menu {
    
    var name: String
    var iconImage: String
    var index: Int
    var section: String
    
    init(name: String, iconImage: String, index: Int, section: String ) {
        self.name = name
        self.iconImage = iconImage
        self.index = index
        self.section = section
    }
    
    convenience init(copying menu: Menu) {
        self.init(name: menu.name, iconImage: menu.iconImage, index: menu.index, section: menu.section)
    }
}
