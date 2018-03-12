//
//  HomeTableViewCell.swift
//  BlackAuburn
//
//  Created by ALYSSA on 2/27/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    let title: UILabel = {
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.sizeToFit()
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    let dateLabel: UILabel = {
        $0.textColor = UIColor.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    let postImage = UIImageView()
    let cardView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let superview = self.contentView
        
        
        superview.addSubview(cardView)
        superview.addSubview(title)
        superview.addSubview(descriptionLabel)
        superview.addSubview(dateLabel)
        superview.addSubview(postImage)
        
        setupCell()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        cardView.backgroundColor = UIColor.white
        cardView.layer.cornerRadius = 3.0
        cardView.layer.masksToBounds = false
        
        cardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.layer.shadowOpacity = 0.8
        
        
        cardView.snp.remakeConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        title.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        }
        
        dateLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(title.snp.right).offset(5)
            make.top.equalToSuperview().offset(15)
        }
        
        descriptionLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(5)
            make.left.equalTo(title)
        }
        
        postImage.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.size.equalTo(100)
        }
        
    }
    
    

}
