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

class CalendarVC: UIViewController {
    
    var monthLabel = UILabel()
    var calendar = Koyomi(frame: CGRect(x: 10, y : 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2), sectionSpace: 1.5, cellSpace: 0.5, inset: .zero, weekCellHeight: 25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        setUpView()
    }
    
    func setUpView() {
        monthLabel.text = calendar.currentDateString()
        monthLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.light)
        view.addSubview(monthLabel)
        
        calendar = Koyomi(frame: CGRect(x: 10, y : 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2), sectionSpace: 1.5, cellSpace: 0.5, inset: .zero, weekCellHeight: 25)
        calendar.selectionMode = .multiple(style: .background)
        view.addSubview(calendar)
        
        monthLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(75)
            make.left.equalTo(150)
        }
        
        calendar.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/2)
            make.top.equalTo(monthLabel.snp.bottom)
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                calendar.display(in: .previous)
                monthLabel.text = calendar.currentDateString()

            case UISwipeGestureRecognizerDirection.left:
                calendar.display(in: .next)
                monthLabel.text = calendar.currentDateString()
            default:
                break
            }
        }
    }
  
    
}
