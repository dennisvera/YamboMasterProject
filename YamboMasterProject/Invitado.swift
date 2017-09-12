//
//  Invitado.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/12/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Invitado {
    
    var name: String
    var photo: String
    var index: Int
    var section: String
    
    init(name: String, photo: String, index: Int, section: String) {
        self.name = name
        self.photo = photo
        self.index = index
        self.section = section
    }
    
    convenience init(copying invitado: Invitado) {
        self.init(name: invitado.name, photo: invitado.photo, index: invitado.index, section: invitado.section)
    }
    
}
