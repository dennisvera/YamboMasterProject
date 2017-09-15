//
//  SolicitudesCollectionViewCell2.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/6/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class SolicitudeCell: UICollectionViewCell {
    @IBOutlet var backgroundCellView: UIView!
    @IBOutlet var atendidaLabel: UILabel!
    @IBOutlet var solicitudLabel: UILabel!
    @IBOutlet var solicitudNoteLabel: UILabel!
    @IBOutlet var mensajeLabel: UILabel!
    @IBOutlet var mensajeNoteLabel: UILabel!
    @IBOutlet var fechaLabel: UILabel!
    @IBOutlet var fechaNoteLabel: UILabel!
    @IBOutlet var atendidoLabel: UILabel!
    @IBOutlet var atendidoNoteLabel: UILabel!
    
    override func prepareForReuse() {
        atendidaLabel.text = ""
        solicitudLabel.text = ""
        solicitudNoteLabel.text = ""
        mensajeLabel.text = ""
        mensajeNoteLabel.text = ""
        fechaLabel.text = ""
        fechaNoteLabel.text = ""
        atendidoLabel.text = ""
        atendidoNoteLabel.text = ""
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var solicitude: Solicitude? {
        didSet {
            if let solicitude = solicitude {
                atendidaLabel.text = solicitude.atendida
                solicitudLabel.text = solicitude.solicitude
                solicitudNoteLabel.text = solicitude.solicitudNote
                mensajeLabel.text = solicitude.mensaje
                mensajeNoteLabel.text = solicitude.mensajeNote
                fechaLabel.text = solicitude.fecha
                fechaNoteLabel.text = solicitude.fechaNote
                atendidoLabel.text = solicitude.atendio
                atendidoNoteLabel.text = solicitude.atendioNote
            }
        }
    }

}
