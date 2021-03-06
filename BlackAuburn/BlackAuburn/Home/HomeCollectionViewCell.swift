//
//  HomeCollectionViewCell.swift
//  BlackAuburn
//
//  Created by ALYSSA on 2/27/18.
//  Copyright © 2018 AlyssaGable. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    let title: UILabel = {
        $0.textColor = UIColor.white
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.sizeToFit()
        return $0
    }(UILabel())
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = false
        return imageView
    }()
    
    let cardView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell() {
       
        image.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        image.layer.shadowOffset = CGSize(width: 0, height: 0)
        image.layer.shadowOpacity = 0.9
        
        addSubview(cardView)
        addSubview(image)
        addSubview(title)
        
        image.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
        
        title.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(60)
            make.top.equalTo(image.snp.bottom).offset(5)
            
        }
        
    }
}
