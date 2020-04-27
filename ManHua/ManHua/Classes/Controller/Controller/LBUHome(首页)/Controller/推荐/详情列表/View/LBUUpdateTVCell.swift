//
//  LBUUpdateTVCell.swift
//  ManHua
//
//  Created by Soul on 14/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUUpdateTVCell: LBUBaseTableViewCell {
    private lazy var coverView: UIImageView = {
        let coverView = UIImageView()
        coverView.contentMode = .scaleAspectFill
        coverView.layer.cornerRadius = 5
        coverView.layer.masksToBounds = true
        return coverView
    }()
    
    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel()
        tipLabel.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        tipLabel.textColor = UIColor.white
        tipLabel.font = UIFont.systemFont(ofSize: 9)
        return tipLabel
    }()
    
    override func setupUI() {
        contentView.addSubview(coverView)
        coverView.snp.makeConstraints{ $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)) }
        
        coverView.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(20)
        }
        
        let line = UIView().then { $0.backgroundColor = UIColor.background }
        contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    var model: LBUComicModel? {
        didSet {
            guard let model = model else { return }
            coverView.kf.setImage(urlString: model.cover)
            tipLabel.text = "    \(model.description ?? "")"
        }
    }
}
