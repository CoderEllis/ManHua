
//
//  LBUChapterHeaderView.swift
//  ManHua
//
//  Created by Soul on 15/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

// 头部
typealias LBUChapterCHeadSortClosure = (_ button: UIButton) -> Void

class LBUChapterHeaderView: LBUBaseCollectionReusableView {
    private var sortClosure: LBUChapterCHeadSortClosure?
    
    private lazy var chapterLabel: UILabel = {
        let chapterLabel = UILabel()
        chapterLabel.textColor = UIColor.gray
        chapterLabel.font = UIFont.systemFont(ofSize: 13)
        return chapterLabel
    }()
    
    private lazy var sortButton: UIButton = {
        let sn = UIButton(type: .system)
        sn.setTitle("倒序", for: .normal)
        sn.setTitleColor(UIColor.gray, for: .normal)
        sn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        sn.addTarget(self, action: #selector(sortAction(for:)), for: .touchUpInside)
        return sn
    }()
    
    @objc private func sortAction(for button: UIButton) {
        guard let sortClosure = sortClosure else { return }
        sortClosure(button)
    }
    
    ///点击回调
    func sortClosure(_ closure: @escaping LBUChapterCHeadSortClosure) {
        sortClosure = closure
    }
    
    override func setupLayout() {
        
        addSubview(sortButton)
        sortButton.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(44)
        }
        
        addSubview(chapterLabel)
        chapterLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.bottom.equalToSuperview()
            make.right.equalTo(sortButton.snp.left).offset(-10)
        }
    }
    
    var model: LBUDetailStaticModel? {
        didSet {
            guard let model = model else { return }
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd"
            let timeString = format.string(from: Date(timeIntervalSince1970: model.comic?.last_update_time ?? 0))
            let upString = model.chapter_list?.last?.name ?? ""
            chapterLabel.text = "目录 \(timeString) 更新 \(upString)"
        }
        
    }

}
