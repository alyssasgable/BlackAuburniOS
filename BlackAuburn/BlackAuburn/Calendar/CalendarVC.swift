//
//  CalendarVC.swift
//  BlackAuburn
//
//  Created by ALYSSA on 3/12/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit
import SnapKit
import FSCalendar
import Koyomi

fileprivate var tableIdentifier = "tableIdentifier"
class CalendarVC: UIViewController, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance{
    
    var datesWithEvent = ["2018-03-10", "2018-03-15", "2018-03-16", "2018-03-12'"]
    fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)


    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
        }()
    
    var tableView = UITableView()
    var calendar = FSCalendar(frame: CGRect(x: 10, y : 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.view.backgroundColor = UIColor.white
        calendar.dataSource = self
        calendar.delegate = self
        
        // Do any additional setup after loading the view.
//        self.view.addGestureRecognizer(self.scopeGesture)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: tableIdentifier)

        
        setUpView()
    }
    
    func setUpView() {
        view.addSubview(tableView)
        
        setUpCalendar()

        view.addSubview(calendar)
        
        calendar.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/2)
            make.top.equalToSuperview().offset(70)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(300)
            make.top.equalTo(calendar.snp.bottom)
        }
    }
    
    func setUpCalendar() {
        //set up appearance
        self.calendar.appearance.weekdayTextColor = UIColor.black
        self.calendar.appearance.headerTitleColor = UIColor.black
        self.calendar.appearance.eventDefaultColor = UIColor.orange
        self.calendar.appearance.selectionColor = UIColor.blue
        self.calendar.appearance.headerDateFormat = "MMMM yyyy"
        self.calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesSingleUpperCase]
        self.calendar.appearance.todayColor = UIColor.lightGray
        self.calendar.appearance.borderRadius = 9
        self.calendar.scope = .month
        self.calendar.scrollDirection = .horizontal
//        self.calendar.scrollEnabled = false
        self.calendar.appearance.eventSelectionColor = UIColor.blue
        
        
        
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let day: Int! = self.gregorian.component(.day, from: date)
        return day % 5 == 0 ? day/5 : 0;
    }
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.dateFormatter.string(from: date))")
        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
        print("selected dates is \(selectedDates)")
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("\(self.dateFormatter.string(from: calendar.currentPage))")
    }
    
    @objc func toggleClicked(sender: AnyObject) {
        if self.calendar.scope == .month {
            self.calendar.setScope(.week, animated: true)
        } else {
            self.calendar.setScope(.month, animated: true)
        }
    }
    
    // MARK:- UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier, for: indexPath) as! HomeTableViewCell
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.title.text = "test"
        cell.dateLabel.text = "test"
        cell.descriptionLabel.text = "test description"
        
        return cell
    }
    
    
    // MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let scope: FSCalendarScope = (indexPath.row == 0) ? .month : .week
            self.calendar.setScope(scope, animated: true)
        }
    }

    
}


