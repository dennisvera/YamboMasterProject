//
//  ReservacioneDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/5/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ReservacioneDetailViewController: UIViewController {
    @IBOutlet var reservacioneImageView: UIImageView!
    var reservacione: Reservacione?
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.loadRightBarButtonItem()

        guard let image = reservacione?.image else {return}
        reservacioneImageView.image = UIImage(named: image)
        
    }
    
}

extension ReservacioneDetailViewController: JTAppleCalendarViewDataSource {

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale

        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!

        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}

extension ReservacioneDetailViewController: JTAppleCalendarViewDelegate  {
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "ReservacioneCalendarCellID", for: indexPath) as! ReservacioneCalendarCell
        cell.dateLabel.text = cellState.text
        
        return cell
    }

    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? ReservacioneCalendarCell else {return}
        validCell.selectedView.isHidden = false
    }
}
















