//
//  DirectoryCellTableViewCell.swift
//  BlackAuburn
//
//  Created by ALYSSA on 3/17/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit

class DirectoryTableViewCell: UITableViewCell {
    
    let student: UILabel = {
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 16.0)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.sizeToFit()
        return $0
    }(UILabel())
    
    let major: UILabel = {
        $0.textColor = UIColor.black
        $0.font = UIFont.italicSystemFont(ofSize: 12.0)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    
    let studentImage: UIImageView = {
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let superview = self.contentView
        
        superview.addSubview(student)
        superview.addSubview(major)
        
//        studentImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        studentImage.layer.cornerRadius = studentImage.bounds.width / 2
        superview.addSubview(studentImage)
        
        setupCell()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        studentImage.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.height.width.equalTo(50)
            make.left.equalToSuperview().offset(20)
        }
        
        student.snp.remakeConstraints { (make) in
            make.left.equalTo(studentImage.snp.right).offset(15)
            make.top.equalTo(studentImage.snp.top).offset(5)
        }
        
        major.snp.remakeConstraints { (make) in
            make.top.equalTo(student.snp.bottom).offset(5)
            make.left.equalTo(student)
        }
        
        
    }
    
}

