//
//  CommunicadosTableViewCell.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/28/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class CommunicadosTableViewCell: UITableViewCell {
    @IBOutlet var comunicadoImage: UIImageView!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
