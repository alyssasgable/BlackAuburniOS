//
//  HomeVC.swift
//  BlackAuburn
//
//  Created by ALYSSA on 2/27/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit

fileprivate var collectionIdentifier = "collectionViewIdentifier"
class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imageArray = [UIImage(named:"test"), UIImage(named:"test1"), UIImage(named:"test2"), UIImage(named:"test3"), UIImage(named:"test4"), UIImage(named:"test5")]

    let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Home"
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        
        //sets up collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0)
            layout.itemSize = CGSize(width: 200, height: 200)
            layout.minimumInteritemSpacing = 10.0
            layout.minimumLineSpacing = 10
        }
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: collectionIdentifier)
        
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
    
    func setUpView() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(300)
        }
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
    
}
