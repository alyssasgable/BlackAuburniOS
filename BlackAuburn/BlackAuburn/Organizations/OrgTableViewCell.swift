//
//  OrgTableViewCell.swift
//  BlackAuburn
//
//  Created by ALYSSA on 3/18/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit
import SnapKit

class OrgTableViewCell: UITableViewCell {
    
    let organization: UILabel = {
        $0.textColor = UIColor.black
        $0.font = UIFont.boldSystemFont(ofSize: 36.0)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.sizeToFit()
        return $0
    }(UILabel())
    
    let caption: UILabel = {
        $0.textColor = UIColor.black
        $0.font = UIFont.italicSystemFont(ofSize: 22.0)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    
    let orgImage: UIImageView = {
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let superview = self.contentView
        
        organization.center = superview.center
        superview.addSubview(organization)
        
        superview.addSubview(caption)
        superview.addSubview(orgImage)
        
        setupCell()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        orgImage.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.height.width.equalTo(300)
            make.right.equalToSuperview().inset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        organization.snp.remakeConstraints { (make) in
            make.top.equalTo(orgImage.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(80 )
            make.right.equalToSuperview()
        }
        
        caption.snp.remakeConstraints { (make) in
            make.top.equalTo(organization.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        
}
}
