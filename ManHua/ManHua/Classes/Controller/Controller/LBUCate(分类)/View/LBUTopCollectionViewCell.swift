//
//  LBUTopCollectionViewCell.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUTopCollectionViewCell: LBUBaseCollectionViewCell {
    private lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.image = UIImage(named: "mine_bg_for_girl")
        iw.contentMode = .scaleAspectFill
        return iw
    }()
    
    override func setupLayout() {
        super.setupLayout()
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        layer.masksToBounds = true
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    var model: LBUTopModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(urlString: model.cover)
        }
    }
}
