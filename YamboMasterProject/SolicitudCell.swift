//
//  SolicitudeCellX.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/19/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class SolicitudCell: UICollectionViewCell {
    @IBOutlet var atendidaLabel: UILabel!
    @IBOutlet var solicitudLabel: UILabel!
    @IBOutlet var solicitudNoteLabel: UILabel!
    @IBOutlet var mensajeLabel: UILabel!
    @IBOutlet var mensajeNoteLabel: UILabel!
    @IBOutlet var fechaLabel: UILabel!
    @IBOutlet var fechaNoteLabel: UILabel!
    @IBOutlet var atendioLabel: UILabel!
    @IBOutlet var atendioNoteLabel: UILabel!
    
    override func prepareForReuse() {
        atendidaLabel.text = ""
        solicitudLabel.text = ""
        solicitudNoteLabel.text = ""
        mensajeLabel.text = ""
        mensajeNoteLabel.text = ""
        fechaLabel.text = ""
        fechaNoteLabel.text = ""
        atendioLabel.text = ""
        atendioNoteLabel.text = ""
    }
    
    var solicitud: Solicitud? {
        didSet {
            if let solicitud = solicitud {
                atendidaLabel.text = solicitud.atendida
                solicitudLabel.text = solicitud.solicitud
                solicitudNoteLabel.text = solicitud.solicitudNote
                mensajeLabel.text = solicitud.mensaje
                mensajeNoteLabel.text = solicitud.mensajeNote
                fechaLabel.text = solicitud.fecha
                fechaNoteLabel.text = solicitud.fechaNote
                atendioLabel.text = solicitud.atendio
                atendioNoteLabel.text = solicitud.atendioNote
            }
        }
    }
    
}
