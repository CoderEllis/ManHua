//
//  LBUBaseTableViewCell.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import Reusable

class LBUBaseTableViewCell: UITableViewCell, Reusable {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupUI() {}

}
