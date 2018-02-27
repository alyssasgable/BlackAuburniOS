//
//  ViewController.swift
//  BlackAuburn
//
//  Created by ALYSSA on 2/24/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import Foundation
import UIKit
import PopupDialog
import SnapKit
import TextFieldEffects

class LoginVC: UIViewController {
    
//    //sets status bar to white
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
       view.backgroundColor = UIColor.black
       self.navigationController?.setNavigationBarHidden(true, animated: true)
        setUpView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    var email = JiroTextField()
    var logoView = UIImageView()
    
    //Creates views and constraints for all elements in view
    func setUpView() {
        let logo = UIImage(named: "logo")
        logoView = UIImageView(image: logo)
        view.addSubview(logoView)
        
        email.borderColor = UIColor.white
        email.placeholder = "Email"
        email.placeholderColor = UIColor.white
        addDoneButtonOnKeyboard(textfield: email)
        email.isHidden = true
        view.addSubview(email)
        
        let username = JiroTextField()
        username.borderColor = UIColor.white
        username.placeholder = "Username"
        username.placeholderColor = UIColor.white
        addDoneButtonOnKeyboard(textfield: username)
        view.addSubview(username)
        
        let password = JiroTextField()
        password.borderColor = UIColor.white
        password.placeholder = "Password"
        password.placeholderColor = UIColor.white
        addDoneButtonOnKeyboard(textfield: password)
        view.addSubview(password)
        
        let submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor.black, for: .normal)
        submitButton.backgroundColor = .white
        submitButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.view.addSubview(submitButton)
        
        let signUpButton = UIButton()
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor.black, for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        
        logoView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.width.equalTo(215)
            make.left.equalToSuperview().offset(90)
            make.top.equalToSuperview().offset(30)
        }
        
        email.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.top.equalTo(logoView.snp.bottom)
        }
        
        username.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.top.equalTo(email.snp.bottom).offset(15)
        }
        
        password.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.top.equalTo(username.snp.bottom).offset(15)
        }
        
        submitButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(password.snp.bottom).offset(50)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(submitButton.snp.bottom).offset(25)
            make.height.equalTo(50)
        }
        
        
    }
    
    //Handles signing up
    @objc func signUp(_: UITextField) {
        email.animateViewsForTextEntry()
        email.isHidden = false
    }
    
    //Handles logging in
    @objc func login() {
        let homeScreen = HomeVC()
        self.navigationController?.pushViewController(homeScreen, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     //Adds done button to keyboard
     func addDoneButtonOnKeyboard(textfield: UITextField)
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textfield.inputAccessoryView = doneToolbar
    }
    
    //dismisses view after done button is clicked
    @objc func doneButtonAction()
    {
        self.view.endEditing(true)
    }

}



