//
//  URefresh.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import MJRefresh

extension UIScrollView {
    var uHead : MJRefreshHeader? {
        get { return mj_header }
        set { mj_header = newValue }
    }
    
    var uFoot: MJRefreshFooter? {
        get { return mj_footer }
        set { mj_footer = newValue }
    }
}

class URefreshHeader: MJRefreshGifHeader {
    override func prepare() {
        super.prepare()
        setImages([UIImage(named: "refresh_normal")!], for: .idle)
        setImages([UIImage(named: "refresh_will_refresh")!], for: .pulling)
        setImages([UIImage(named: "refresh_loading_1")!,
                   UIImage(named: "refresh_loading_2")!,
                   UIImage(named: "refresh_loading_3")!], for: .refreshing)
        
        lastUpdatedTimeLabel?.isHidden = true
        stateLabel?.isHidden = true
    }
}

class URefreshAutoHeader: MJRefreshHeader {}

class URefreshFooter: MJRefreshBackNormalFooter {}

class URefreshAutoFooter: MJRefreshAutoFooter {}

class URefreshDiscoverFooter: MJRefreshBackGifFooter {
    override func prepare() {
        super.prepare()
        backgroundColor = UIColor.background
        setImages([UIImage(named: "refresh_discover")!], for: .idle)
        stateLabel?.isHidden = true
        refreshingBlock = { self.endRefreshing() }
    }
}

class URefreshTipKissFooter: MJRefreshBackFooter {
    lazy var tipLabel: UILabel = {
        let tipLabel = UILabel()
        tipLabel.textAlignment = .center
        tipLabel.textColor = UIColor.lightGray
        tipLabel.font = UIFont.systemFont(ofSize: 14)
        tipLabel.numberOfLines = 0
        return tipLabel
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "refresh_kiss")
        return imageView
    }()
    
    override func prepare() {
        super.prepare()
        backgroundColor = UIColor.background
        mj_h = 240
        addSubview(tipLabel)
        addSubview(imageView)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        tipLabel.frame = CGRect(x: 0, y: 40, width: bounds.width, height: 60)
        imageView.frame = CGRect(x: (bounds.width - 80) / 2, y: 110, width: 80, height: 80)
    }
    
    convenience init(with tip: String) {
        self.init()
        refreshingBlock = { self.endRefreshing() }
        tipLabel.text = tip
    }
}
