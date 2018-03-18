//
//  OrgVC.swift
//  BlackAuburn
//
//  Created by ALYSSA on 3/18/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit

class OrgVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 500
        tableView.separatorStyle = .none
        tableView.register(OrgTableViewCell.self, forCellReuseIdentifier: "tableIdentifier")
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(70)
            make.bottom.equalToSuperview()
        }
        
    }   //MARK: - Tableview Delegate & Datasource
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableIdentifier", for: indexPath) as! OrgTableViewCell
        cell.organization.text = "Alyssa Gable"
        
        let image = UIImage(named: "test")
        cell.orgImage.image = image
        
        cell.caption.text = "Computer Science is Alyssa's major and it sucks."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
