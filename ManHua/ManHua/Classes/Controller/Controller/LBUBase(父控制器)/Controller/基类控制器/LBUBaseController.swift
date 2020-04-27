//
//  LBUBaseController.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import Then
import Reusable

class LBUBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        setupLayout()
    }
    
    func setupLayout() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.barStyle(.theme)
            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), target: self, action: #selector(pressBack))
            }
        }
        
        
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
}


extension LBUBaseController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
