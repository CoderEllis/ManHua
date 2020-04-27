//
//  LBUSearchHeadView.swift
//  ManHua
//
//  Created by Soul on 10/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

typealias LBUSearchTHeadMoreActionClosure = () -> ()

protocol LBUSearchHeadViewDelegate: class {
    func searchHeadView(_ searchTHead: LBUSearchHeadView, moreAction button: UIButton)
}

class LBUSearchHeadView: LBUBaseTableViewHeaderFooterView {

    weak var delegate: LBUSearchHeadViewDelegate?
    
    private var moreActionClosure: LBUSearchTHeadMoreActionClosure?
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.red
        return titleLabel
    }()
    
    lazy var moreButton: UIButton = {
        let moreButton = UIButton(type: .custom)
        moreButton.setTitleColor(UIColor.lightGray, for: .normal)
        moreButton.addTarget(self, action: #selector(moreAction(_:)), for: .touchUpInside)
        return moreButton
    }()
    
    @objc private func moreAction(_ button: UIButton) {
        delegate?.searchHeadView(self, moreAction: button)
        guard let closure = moreActionClosure else { return }
        closure()
    }
    
    func moreActionClosure(_ closure: @escaping LBUSearchTHeadMoreActionClosure) {
        moreActionClosure = closure
    }
    
    override func setupLayout() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(200)
        }
        
        contentView.addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(40)
        }
        
        let line = UIView().then { $0.backgroundColor = UIColor.background }
        contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }

}
