//
//  LBUBaseTableViewHeaderFooterView.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import Reusable

class LBUBaseTableViewHeaderFooterView: UITableViewHeaderFooterView, Reusable {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupLayout() {}
    
}
