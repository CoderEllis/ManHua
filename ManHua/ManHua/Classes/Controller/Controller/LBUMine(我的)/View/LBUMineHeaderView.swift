//
//  LBUMineHeaderView.swift
//  ManHua
//
//  Created by Soul on 27/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUMineHeaderView: UIView {

    lazy var bgView: UIImageView = {
        let bgView = UIImageView()
        bgView.contentMode = .scaleAspectFill
        return bgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(sexTypeDidChange), name: .USexTypeDidChange, object: nil)
        sexTypeDidChange()
    }
    
    @objc func sexTypeDidChange() {
        let sexType = UserDefaults.standard.integer(forKey: String.sexTypeKey)
        if sexType == 1 {
            bgView.image = UIImage(named: "mine_bg_for_boy")
        } else {
            bgView.image = UIImage(named: "mine_bg_for_girl")
        }
    }
}
