//
//  LBUTicketTVCell.swift
//  ManHua
//
//  Created by Soul on 14/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUTicketTVCell: LBUBaseTableViewCell {

    var model: LBUDetailRealtimeModel? {
        didSet {
            guard let model = model else { return }
            let text = NSMutableAttributedString(string: "本月月票       |     累计月票  ",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
            text.insert(NSAttributedString(string: "\(model.comic?.monthly_ticket ?? "")",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]),
                        at: 6)
            text.append(NSAttributedString(string: "\(model.comic?.total_ticket ?? "")",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))
            textLabel?.attributedText = text
            textLabel?.textAlignment = .center
        }
    }

}
