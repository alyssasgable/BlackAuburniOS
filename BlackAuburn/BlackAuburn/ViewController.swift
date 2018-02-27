//
//  ViewController.swift
//  BlackAuburn
//
//  Created by ALYSSA on 2/24/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit
import PopupDialog
import SnapKit
import TextFieldEffects

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       view.backgroundColor = UIColor.black
       
        setUpView()
    }
    
    
    
    func setUpView() {
        
        let logo = UIImage(named: "logo")
        let logoView = UIImageView(image: logo)
        view.addSubview(logoView)
        
        let username = JiroTextField()
        username.borderColor = UIColor.white
        username.placeholder = "Username"
        username.placeholderColor = UIColor.white
        view.addSubview(username)
        
        let password = JiroTextField()
        password.borderColor = UIColor.white
        password.placeholder = "Password"
        password.placeholderColor = UIColor.white
        view.addSubview(password)
        
        let submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor.black, for: .normal)
        submitButton.backgroundColor = .white
        submitButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.view.addSubview(submitButton)
        
        logoView.snp.makeConstraints { (make) in
            make.width.height.equalTo(200)
            make.left.equalTo(75)
            make.right.equalTo(-75)
            make.top.equalToSuperview().offset(30)
        }
        
        username.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
            make.top.equalTo(logoView.snp.bottom)
        }
        
        password.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(username.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
        submitButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(password.snp.bottom).offset(50)
            make.height.equalTo(50)
        }
        
        
    }
    
    @objc func login() {
        
    }
    override func viewDidAppear(_ animated: Bool) {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

