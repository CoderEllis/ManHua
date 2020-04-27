//
//  LBUOtherWorksTCell.swift
//  ManHua
//
//  Created by Soul on 14/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUOtherWorksTCell: LBUBaseTableViewCell {

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: LBUDetailStaticModel? {
        didSet{
            guard let model = model else { return }
            textLabel?.text = "其他作品"
            detailTextLabel?.text = "\(model.otherWorks?.count ?? 0)本"
            detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
        }
    }

}
