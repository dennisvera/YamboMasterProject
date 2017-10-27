//
//  ReservacioneDetailViewController.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 10/5/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import JTAppleCalendar
import MVHorizontalPicker

private let reservacioneCalendarCellID = "ReservacioneCalendarCellID"

class ReservacioneDetailViewController: UIViewController {
    
    @IBOutlet var reservacioneImageView: UIImageView!
    @IBOutlet var calendarView: JTAppleCalendarView!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var timeSlotLabel: UILabel!
    @IBOutlet var picker: MVHorizontalPicker!
    
    // MARK: - Variables
    var reservacione: Reservacione?
    
    let outsideMonthColor = UIColor.gray
    let monthColor = UIColor.yamboBlue
    let selectorMonthColor = UIColor.white
    let currentDateSelectedViewColor = UIColor.red
    
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
    
    let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.locale = Calendar.current.locale
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadReservacioneData()
        self.navigationItem.loadRightBarButtonItem()
        
        // MARK: - Time picker
        picker.titles = [ "10a - 11a", "11a - 12p", "12p - 1p", "1p - 2p", "2p - 3p", "3p - 4p", "4p - 5p", "5p - 6p", "6p - 7p", "7p - 8p", "8p - 9p", "9p - 10p", "10p - 11p" ]
        picker.tintColor = .yamboBlue
        picker.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        picker.itemWidth = 125
        
        updateTimeSlotLabel()
        
        
        // MARK: - Calendar setup View
        calendarView.scrollToDate(Date(), animateScroll: false)
        calendarView.selectDates([ Date() ])
        
        calendarView.visibleDates { dateSegment in
            self.setupCalendarView(dateSegment: dateSegment)
        }
    }
    
    func loadReservacioneData() {
        guard let image = reservacione?.image else {return}
        reservacioneImageView.image = UIImage(named: image)
    }
    
    // MARK: - MVHorizontalPicker functions
    
    @IBAction func pickerValueChanged(sender: AnyObject) {
        updateTimeSlotLabel()
    }
    
    func updateTimeSlotLabel() {
        timeSlotLabel.text = picker.titles[picker.selectedItemIndex]
    }
    
    // MARK: - JTAppleCalendar functions
    
    func setupCalendarView(dateSegment: DateSegmentInfo) {
        guard let date = dateSegment.monthDates.first?.date else {return}
        
        formatter.dateFormat = "MMM"
        monthLabel.text = formatter.string(from: date)
        
        formatter.dateFormat = "yyyy"
        yearLabel.text = formatter.string(from: date)
    }
    
    /* CELL CONFIGURATION FUNCTIONS */
    func configureCell(cell: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = cell as? ReservacioneCalendarCell else {return}
        
        handleCellTextColor(cell: myCustomCell, cellState: cellState)
        handleCellVisibility(cell: myCustomCell, cellState: cellState)
        handleCellSelection(cell: myCustomCell, cellState: cellState)
    }
    
    func handleCellTextColor(cell: ReservacioneCalendarCell, cellState: CellState) {
        let todaysDate = Date()
        
        formatter.dateFormat = "yyyy MM dd"
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        
        if todaysDateString == monthDateString {
            cell.dateLabel.textColor = .lightGray
        } else {
            cell.dateLabel.textColor = cellState.isSelected ? .white : .yamboBlue
        }
    }
    
    func handleCellVisibility(cell: ReservacioneCalendarCell, cellState: CellState) {
        cell.isHidden = cellState.dateBelongsTo == .thisMonth ? false : true
    }
    
    func handleCellSelection(cell: ReservacioneCalendarCell, cellState: CellState) {
        cell.selectedView.isHidden = cellState.isSelected ? false : true
    }
    
    //MARK: - Date converter
    func convertDateFormater(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return  dateFormatter.string(from: date!)
    }
    
}

// MARK: - JTAppleCalendarViewDataSource & JTAppleCalendarViewDelegate

extension ReservacioneDetailViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        print(date)
        
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let startDate = formatter.date(from: "2017 02 01")!
        let endDate = formatter.date(from: "2019 12 31")!
        
        //        let parameter = ConfigurationParameters(startDate: startedDate, endDate: Date())
        
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
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: reservacioneCalendarCellID, for: indexPath) as! ReservacioneCalendarCell
        
        cell.dateLabel.text = cellState.text
        configureCell(cell: cell, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
        
        let date = "\(date)"
        let selectedDate = convertDateFormater(date)
        dateLabel.text = selectedDate
        print("Selected date: \(selectedDate)")
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupCalendarView(dateSegment: visibleDates)
    }
}












//    func setupCalendarView() {
//        // Setup calendar spacing
//        calendarView.minimumLineSpacing = 0
//        calendarView.minimumInteritemSpacing = 0
//
//        // Setup labels
//        calendarView.visibleDates { visibleDates in
//            self.setupViewsOfCalendar(from: visibleDates)
//        }
//    }
//
//    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
//        let date = visibleDates.monthDates.first!.date
//
//        self.formatter.dateFormat = "yyyy"
//        self.yearLabel.text = self.formatter.string(from: date)
//
//        self.formatter.dateFormat = "MMMM"
//        self.monthLabel.text = self.formatter.string(from: date)
//    }
//
//    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
//        guard let validCell = view as? ReservacioneCalendarCell else {return}
//
//        let todaysDate = Date()
//        if todaysDate == cellState.date {
//            validCell.dateLabel.textColor = .gray
//        } else if cellState.isSelected {
//            validCell.dateLabel.textColor = selectorMonthColor
//        } else if cellState.dateBelongsTo == .thisMonth {
//            validCell.dateLabel.textColor = monthColor
//        } else {
//            validCell.dateLabel.textColor = outsideMonthColor
//        }
//    }
//
//    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
//        guard let validCell = view as? ReservacioneCalendarCell else {return}
//
//        if cellState.isSelected {
//            validCell.selectedView.isHidden = false
//        } else {
//            validCell.selectedView.isHidden = true
//        }
//    }
//
//    func convertDateFormater(_ date: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
//
//        let date = dateFormatter.date(from: date)
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//
//        return  dateFormatter.string(from: date!)
//    }
//}

//// MARK: - JTAppleCalendarViewDataSource
//
//extension ReservacioneDetailViewController: JTAppleCalendarViewDataSource {
//
//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//        formatter.dateFormat = "yyyy MM dd"
//        formatter.timeZone = Calendar.current.timeZone
//        formatter.locale = Calendar.current.locale
//
//        let startDate = formatter.date(from: "2017 01 01")!
//        let endDate = formatter.date(from: "2018 12 31")!
//
//        let parameters = ConfigurationParameters(startDate: startDate,
//                                                 endDate: endDate,
//                                                 numberOfRows: numberOfRows,
//                                                 calendar: testCalendar,
//                                                 generateInDates: generateInDates,
//                                                 generateOutDates: generateOutDates,
//                                                 firstDayOfWeek: firstDayOfWeek,
//                                                 hasStrictBoundaries: hasStrictBoundaries)
//        return parameters
//    }
//}
//
//// MARK: - JTAppleCalendarViewDelegate
//
//extension ReservacioneDetailViewController: JTAppleCalendarViewDelegate  {
//
//    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//        print(date)
//    }
//
//
//    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: reservacioneCalendarCellID, for: indexPath) as! ReservacioneCalendarCell
//
//        cell.dateLabel.text = cellState.text
//
//        //        handleCellSelected(view: cell, cellState: cellState)
//        //        handleCellTextColor(view: cell, cellState: cellState)
//
//        return cell
//    }
//
//    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
//        //        handleCellSelected(view: cell, cellState: cellState)
//        //        handleCellTextColor(view: cell, cellState: cellState)
//
//        //        let jtDate = "\(date)"
//        //        let date = convertDateFormater(jtDate)
//        //        dateLabel.text = date
//        //        print("Date selected: \(date)")
//    }
//
//    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
//        //        handleCellSelected(view: cell, cellState: cellState)
//        //        handleCellTextColor(view: cell, cellState: cellState)
//    }
//
//    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
//        //        self.setupViewsOfCalendar(from: visibleDates)
//    }
//}

















