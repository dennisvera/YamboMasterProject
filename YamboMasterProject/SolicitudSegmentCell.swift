//
//  SolicitudSegmentCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/20/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class SolicitudSegmentCell: UICollectionViewCell {
    @IBOutlet var solicitudLabel: UILabel!
    
    override func prepareForReuse() {
        solicitudLabel.text = ""
    }
    
}
