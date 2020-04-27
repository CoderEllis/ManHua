//
//  LBUHomeController.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUHomeController: LBUPageController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"), target: self, action: #selector(searchButtonClick))
    }
    
    @objc private func searchButtonClick() {
        navigationController?.pushViewController(LBUSearchController(), animated: true)
    }

}
