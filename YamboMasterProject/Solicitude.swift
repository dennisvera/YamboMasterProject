//
//  Solicitude.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/15/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Solicitude {
    
    var atendida: String
    var solicitude: String
    var solicitudNote: String
    var mensaje: String
    var mensajeNote: String
    var fecha: String
    var fechaNote: String
    var atendio: String
    var atendioNote: String
    var index: Int
    var section: String
    
    init(atendida: String, solicitude: String, solicitudNote: String, mensaje: String, mensajeNote: String, fecha: String, fechaNote: String, atendio: String, atendioNote: String, index: Int, section: String) {
        self.atendida = atendida
        self.solicitude = solicitude
        self.solicitudNote = solicitudNote
        self.mensaje = mensaje
        self.mensajeNote = mensajeNote
        self.fecha = fecha
        self.fechaNote = fechaNote
        self.atendio = atendio
        self.atendioNote = atendioNote
        self.index = index
        self.section = section
    }
    
    convenience init(copying solicitude: Solicitude) {
        self.init(atendida: solicitude.atendida, solicitude: solicitude.solicitude, solicitudNote: solicitude.solicitudNote, mensaje: solicitude.mensaje, mensajeNote: solicitude.mensajeNote, fecha: solicitude.fecha, fechaNote: solicitude.fechaNote, atendio: solicitude.atendio, atendioNote: solicitude.atendioNote, index: solicitude.index, section: solicitude.section)
    }

}
