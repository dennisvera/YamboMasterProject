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
    var index: Int
    var section: String
    
    init(name: String, subject: String, image: String,  index: Int, section: String) {
        self.name = name
        self.subject = subject
        self.image = image
        self.index = index
        self.section = section
    }
    
    convenience init(copying comunicado: Comunicado) {
        self.init(name: comunicado.name, subject: comunicado.subject, image: comunicado.image, index: comunicado.index, section: comunicado.section)
    }
    
}
