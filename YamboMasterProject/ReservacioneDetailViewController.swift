//
//  ReservacioneDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/5/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import JTAppleCalendar
import LFTimePicker

private let reservacioneCalendarCellID = "ReservacioneCalendarCellID"

class ReservacioneDetailViewController: UIViewController {
    
    @IBOutlet var reservacioneImageView: UIImageView!
    @IBOutlet var calendarView: JTAppleCalendarView!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var monthLabel: UILabel!
    
    // MARK: - Variables
    let timePicker = LFTimePickerController()
    var reservacione: Reservacione?
    
    let outsideMonthColor = UIColor.gray
    let monthColor = UIColor.yamboBlue
    let selectorMonthColor = UIColor.white
    let currentDateSelectedViewColor = UIColor.red
    
    let formatter = DateFormatter()
    var numberOfRows = 1
    var testCalendar = Calendar.current
    var generateInDates: InDateCellGeneration = .forAllMonths
    var generateOutDates: OutDateCellGeneration = .tillEndOfGrid
    var prePostVisibility: ((CellState, ReservacioneCalendarCell?)->())?
    var hasStrictBoundaries = true
    let firstDayOfWeek: DaysOfWeek = .monday
    let disabledColor = UIColor.lightGray
    let enabledColor = UIColor.blue
    let dateCellSize: CGFloat? = nil
    var monthSize: MonthSize? = nil
    var prepostHiddenValue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendarView()
        loadReservacioneData()
        self.navigationItem.loadRightBarButtonItem()
        
        timePicker.delegate = self
        timePicker.timeType = .hour12
    }
    
    func loadReservacioneData() {
        guard let image = reservacione?.image else {return}
        reservacioneImageView.image = UIImage(named: image)
    }
    
    func setupCalendarView() {
        // Setup calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // Setup labels
        calendarView.visibleDates { visibleDates in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.yearLabel.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.monthLabel.text = self.formatter.string(from: date)
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? ReservacioneCalendarCell else {return}
        
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectorMonthColor
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = monthColor
            } else {
                validCell.dateLabel.textColor = outsideMonthColor
            }
        }
    }
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? ReservacioneCalendarCell else {return}
        
        if cellState.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
}

// MARK: - JTAppleCalendarViewDataSource
extension ReservacioneDetailViewController: JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: numberOfRows,
                                                 calendar: testCalendar,
                                                 generateInDates: generateInDates,
                                                 generateOutDates: generateOutDates,
                                                 firstDayOfWeek: firstDayOfWeek,
                                                 hasStrictBoundaries: hasStrictBoundaries)
        return parameters
    }
}

// MARK: - JTAppleCalendarViewDelegate
extension ReservacioneDetailViewController: JTAppleCalendarViewDelegate  {
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: reservacioneCalendarCellID, for: indexPath) as! ReservacioneCalendarCell
        
        cell.dateLabel.text = cellState.text
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        self.setupViewsOfCalendar(from: visibleDates)
    }
}

// MARK: - LFTimePickerDelegate
extension ReservacioneDetailViewController: LFTimePickerDelegate {
    
    func didPickTime(_ start: String, end: String) {
        //        self.lblStartSelectedTime.text = start
        //        self.lblFinishSelectedTime.text = end
        
        print(start)
        print(end)
    }
}
















