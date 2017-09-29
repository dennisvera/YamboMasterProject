//
//  Home.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/23/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Home {
    
    var day: String
    var date: String
    var verCalendario: String
    var menuImage: String
    var menuTitle: String
    var index: Int
    var section: String
    
    init(day: String, date: String, verCalendario: String, menuImage: String, menuTitle: String, index: Int, section: String) {
        self.day = day
        self.date = date
        self.verCalendario = verCalendario
        self.menuImage = menuImage
        self.menuTitle = menuTitle
        self.index = index
        self.section = section
    }
    
    convenience init(copying home: Home) {
        self.init(day: home.day, date: home.date, verCalendario: home.verCalendario, menuImage: home.menuImage, menuTitle: home.menuTitle, index: home.index, section: home.section)
    }
    
}
