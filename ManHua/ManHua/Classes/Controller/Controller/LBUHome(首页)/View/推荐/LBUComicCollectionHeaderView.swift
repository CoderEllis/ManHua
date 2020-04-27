//
//  LBUComicCollectionHeaderView.swift
//  ManHua
//
//  Created by Soul on 28/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

typealias LBUComicCollectionHeaderMoreActionBlock = () -> Void

protocol LBUComicCollecHeaderViewDelegate: class {
    func comicCollectionHeaderView(_ comicCHead: LBUComicCollectionHeaderView, moreAction button: UIButton)
}

class LBUComicCollectionHeaderView: LBUBaseCollectionReusableView {
    weak var delegate: LBUComicCollecHeaderViewDelegate?
    
    private var moreActionClosure : LBUComicCollectionHeaderMoreActionBlock?
    
    
    lazy var iconView: UIImageView = {
        return UIImageView()
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    lazy var moreButton: UIButton = {
        let moreButton = UIButton(type: .system)
        moreButton.setTitle("•••", for: .normal)
        moreButton.setTitleColor(UIColor.lightGray, for: .normal)
        moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        moreButton.addTarget(self, action: #selector(moreActionClick(_:)), for: .touchUpInside)
        return moreButton
    }()
    
    @objc func moreActionClick(_ button: UIButton) {
        delegate?.comicCollectionHeaderView(self, moreAction: button)
        guard let closure = moreActionClosure else { return }
        closure()
    }
    
    func moreActionClosure(_ closure: LBUComicCollectionHeaderMoreActionBlock?) {
        moreActionClosure = closure
    }
    
    // 继承父类方法 布局
    override func setupLayout() {
        
        addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(5)
            make.centerY.height.equalTo(iconView)
            make.width.equalTo(200)
        }
        
        addSubview(moreButton)
        moreButton.snp.makeConstraints { (make) in
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(40)
        }
        
    }
}
