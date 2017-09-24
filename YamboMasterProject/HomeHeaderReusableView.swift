//
//  HomeHeaderReusableView.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 9/23/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeHeaderReusableView: UICollectionReusableView {
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var verCalendarLabel: UILabel!
    
    override func prepareForReuse() {
        dayLabel.text = ""
        dateLabel.text = ""
        verCalendarLabel.text = ""
    }
    
    var homeHeader: Home? {
        didSet {
            if let home = homeHeader {
                dayLabel.text = home.day
                dateLabel.text = home.date
                verCalendarLabel.text = home.verCalendario
            }
        }
    }
    
        
}
