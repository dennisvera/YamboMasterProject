//
//  ComunicadoDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/29/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ComunicadoDetailViewController: UIViewController {
    
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    var comunicado: Comunicado?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadComunicadoDetailView()
        self.navigationItem.loadRightBarButtonItem()
    }
    
    func loadComunicadoDetailView() {
        guard let subject = comunicado?.subject else {return}
        subjectLabel.text = subject
        guard let date = comunicado?.date else {return}
        dateLabel.text = date
        guard let time = comunicado?.time else {return}
        timeLabel.text = time
        guard let message = comunicado?.message else {return}
        messageLabel.text = message
        title = "COMUNICADO"
    }
    
}
