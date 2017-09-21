//
//  SolicitudPendiente.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/20/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import Foundation

class SolicitudPendiente {
    
    var atendida: String
    var solicitud: String
    var solicitudNote: String
    var mensaje: String
    var mensajeNote: String
    var fecha: String
    var fechaNote: String
    var atendio: String
    var atendioNote: String
    var index: Int
    var section: String
    
    init(atendida: String, solicitud: String, solicitudNote: String, mensaje: String, mensajeNote: String, fecha: String, fechaNote: String, atendio: String, atendioNote: String, index: Int, section: String) {
        self.atendida = atendida
        self.solicitud = solicitud
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
    
    convenience init(copying solicitudPendiente: SolicitudPendiente) {
        self.init(atendida: solicitudPendiente.atendida, solicitud: solicitudPendiente.solicitud, solicitudNote: solicitudPendiente.solicitudNote, mensaje: solicitudPendiente.mensaje, mensajeNote: solicitudPendiente.mensajeNote, fecha: solicitudPendiente.fecha, fechaNote: solicitudPendiente.fechaNote, atendio: solicitudPendiente.atendio, atendioNote: solicitudPendiente.atendioNote, index: solicitudPendiente.index, section: solicitudPendiente.section)
    }
    
}

