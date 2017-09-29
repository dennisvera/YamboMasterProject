//
//  Comunicado.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/28/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Comunicado {
    
    var name: String
    var subject: String
    var image: String
    var message: String
    var date: String
    var time: String
    var index: Int
    var section: String
    
    init(name: String, subject: String, message: String, date: String, time: String, image: String,  index: Int, section: String) {
        self.name = name
        self.subject = subject
        self.image = image
        self.message = message
        self.date = date
        self.time = time
        self.index = index
        self.section = section
    }
    
    convenience init(copying comunicado: Comunicado) {
        self.init(name: comunicado.name, subject: comunicado.subject, message: comunicado.message, date: comunicado.date, time: comunicado.time, image: comunicado.image, index: comunicado.index, section: comunicado.section)
    }
    
}
