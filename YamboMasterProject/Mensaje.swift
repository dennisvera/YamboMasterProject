//
//  Mensaje.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/25/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Mensaje {
    
    var name: String
    var image: String
    var message: String
    var date: String
    var index: Int
    var section: String
    
    init(name: String, image: String, message: String, date: String, index: Int, section: String) {
        self.name = name
        self.image = image
        self.message = message
        self.date = date
        self.index = index
        self.section = section
    }
    
    convenience init(copying mensaje: Mensaje) {
        self.init(name: mensaje.name, image: mensaje.image, message: mensaje.message, date: mensaje.date, index: mensaje.index, section: mensaje.section)
    }
}
