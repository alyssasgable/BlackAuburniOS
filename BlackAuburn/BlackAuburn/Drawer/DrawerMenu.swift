//
//  DrawerMenu.swift
//  BlackAuburn
//
//  Created by ALYSSA on 3/8/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit
import SnapKit

class DrawerMenu: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menuButtons = [["title":"Calendar", "selector":"goToCalendar"], ["title":"Directory", "selector":"goToDirectory"], ["title":"Organizations", "selector":"goToOrganizations"]]
        
//        ["Calendar", "Directory", "Organizations", "Moves", "Study Resources", "Black Plainsmen", "Memes", "Blogs", "Settings"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        let tableView = UITableView()

        self.view.backgroundColor = UIColor.black
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 70.0
        tableView.register(DrawerCell.self, forCellReuseIdentifier: "menuButtonIdentifier")
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuButtons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuButtonIdentifier", for: indexPath) as! DrawerCell

        cell.menuButton.setTitle(menuButtons[indexPath.row]["title"], for: .normal)
        cell.menuButton.addTarget(self, action: Selector(menuButtons[indexPath.row]["selector"]!), for: .touchUpInside)

        return cell
    }
 
    
    @objc func goToCalendar() {
        self.navigationController?.pushViewController(CalendarVC(), animated: true)
    }
    @objc func goToDirectory() {
        self.navigationController?.pushViewController(DirectoryVC(), animated: true)
    }
    @objc func goToOrganizations() {
        self.navigationController?.pushViewController(OrgVC(), animated: true)
    }
}

import UIKit

class DrawerCell: UITableViewCell {
    
    let menuButton: UIButton = {
//        $0.setTitle("Submit", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .white
//        $0.addTarget(self, action: #selector(login), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let superview = self.contentView

        superview.addSubview(menuButton)
    
        setupCell()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
    
        menuButton.snp.remakeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
