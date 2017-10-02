//
//  ComunicadoCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/28/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ComunicadoCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var comunicadoImageView: UIImageView!

    override func prepareForReuse() {
        nameLabel.text = ""
        subjectLabel.text = ""
        comunicadoImageView.image = nil
    }
    
    var comunicado: Comunicado? {
        didSet {
            if let comunicado = comunicado {
                nameLabel.text = comunicado.name
                subjectLabel.text = comunicado.subject
                comunicadoImageView.image = UIImage(named: comunicado.image)
            }
        }
    }

}
