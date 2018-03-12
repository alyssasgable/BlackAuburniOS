//
//  HomeVC.swift
//  BlackAuburn
//
//  Created by ALYSSA on 2/27/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit
import FontAwesomeKit
import SideMenu

fileprivate var collectionIdentifier = "collectionViewIdentifier"
fileprivate var tableIdentifier = "tableIdentifier"
class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var imageArray = [UIImage(named:"test"), UIImage(named:"test1"), UIImage(named:"test2"), UIImage(named:"test3"), UIImage(named:"test4"), UIImage(named:"test5")]
    
    var postDic = [["date":"Feb 27, 2018", "title":"Test", "description":"This is a test description."], ["date":"Feb 28, 2018", "title":"Test 2", "description":"This is a test description."], ["date":"Mar 1, 2018", "title":"Test 3"], ["date":"Mar 2, 2018", "title":"Test 4", "description":"This is a test description."], ["date":"Mar 3, 2018", "title":"Test 5", "description":"This is a test description."], ["date":"Mar 4, 2018", "title":"Test 6", "description":"This is a test description."]]

    let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up navigation
        setUpNav()
        
        //sets up collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
            layout.itemSize = CGSize(width: 175, height: 200)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: collectionIdentifier)
        
        //sets up table view
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 120.0
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: tableIdentifier)
        
        //left menu
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: DrawerMenu())
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        //right menu
        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: DrawerMenu())
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController

        //adds gestures
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

        setUpView()
    }
    //reloads collection view everytime the view appears
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //sets up navbar
    func setUpNav() {
        self.title = "Home"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.view.backgroundColor = .black
        self.navigationItem.hidesBackButton = true
        
        
        let drawerIcon = FAKFoundationIcons.listIcon(withSize: 40)
        drawerIcon?.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.white])
        let drawerImage = drawerIcon?.image(with: CGSize(width: 40, height: 40))
        
        let drawerBtn: UIButton = UIButton(type: UIButtonType.custom)
        drawerBtn.setImage(drawerImage, for: .normal)
        let drawerButton = UIBarButtonItem(customView: drawerBtn)
        self.navigationItem.rightBarButtonItem = drawerButton
        drawerBtn.addTarget(self, action: #selector(showDrawer), for: .touchUpInside)
        
//        let homeButton: UIButton = UIButton(type: UIButtonType.custom)
//        homeButton.setImage(UIImage(named: "logo"), for: .normal)
//        //        button.addTarget(self, action: #selector(nil), for: .touchUpInside)
//        homeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//
//        let logoButton = UIBarButtonItem(customView: homeButton)
//        //assign button to navigationbar
//        self.navigationItem.leftBarButtonItem = logoButton
        
        let leftButton = UIButton(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
        let background = UIImageView(image: UIImage(named: "logo"))
        background.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        leftButton.addSubview(background)
        self.navigationController?.navigationBar.addSubview(leftButton)
        
        leftButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(50)
        }
    }
    func setUpView() {
        collectionView.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView)
        tableView.backgroundColor = UIColor.clear
        self.view.addSubview(tableView)
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(230)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom)
            make.bottom.equalToSuperview()
        }
    
}
    
    @objc func showDrawer() {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)

    }
    
    
//Collection View Controller functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.image.image = imageArray[indexPath.row]
        cell.title.text = "Test"
        
        return cell
    }
//Table View Controller functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableIdentifier, for: indexPath) as! HomeTableViewCell
        
        let post = postDic[indexPath.row]
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.title.text = post["title"]
        cell.dateLabel.text = post["date"]
        cell.descriptionLabel.text = post["description"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

}
