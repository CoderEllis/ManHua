//
//  LBUBaseCollectionReusableView.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import Reusable

class LBUBaseCollectionReusableView: UICollectionReusableView, Reusable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupLayout() {}
}
