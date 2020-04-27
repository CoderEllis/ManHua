//
//  LBUBoardCollectionViewCell.swift
//  ManHua
//
//  Created by Soul on 10/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUBoardCollectionViewCell: LBUBaseCollectionViewCell {

    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
        return iconView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        return titleLabel
    }()
    
    override func setupLayout() {
        clipsToBounds = true
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(1)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom)
            make.right.left.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
            make.height.equalTo(20)
        }
    }
    
    var model: LBUComicModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(urlString: model.cover)
            titleLabel.text = model.name
        }
    }
    
}
