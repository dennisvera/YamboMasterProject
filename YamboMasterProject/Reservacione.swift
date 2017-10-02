//
//  Reservacione.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/2/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Reservacione {
    
    var image: String
    var title: String
    var index: Int
    var section: String
    
    init(image: String, title: String, index: Int, section: String) {
        self.image = image
        self.title = title
        self.index = index
        self.section = section
    }
    
    convenience init(copying reservacione: Reservacione) {
        self.init(image: reservacione.image, title: reservacione.title, index: reservacione.index, section: reservacione.section)
    }
}
