//
//  LBUTabBarController.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        setUI()
    }
    

    func setUI() {
        let titleArray = [
            ["首页","tab_home","tab_home_S"],
            ["分类","tab_class","tab_class_S"],
            ["书架","tab_book","tab_book_S"],
            ["我的","tab_mine","tab_mine_S"]]
        
        let pageTieleArray = [["推荐","VIP","订阅","排行"],
                              ["收藏","书单","下载"]]
        let pageVCArrat = [[LBUHomeCommentController(),
                            LBUHomeVIPController(),
                            LBUHomeSubscibeController(),
                            LBUHomeRankController()],
                           [LBUBookCollectionController(),
                            LBUBookDocumentController(),
                            LBUBookDownloadController()]]
        
        let onePageVC = LBUHomeController(titles: pageTieleArray[0], 
                                          vcs: pageVCArrat[0], 
                                          pageStyle: .navgationBarSegment)
        
        let classVC = LBUCateController()
        
        let bookVC = LBUBookController(titles: pageTieleArray[1], 
                                       vcs: pageVCArrat[1], 
                                       pageStyle: .navgationBarSegment)
        
        let mineVC = LBUMineController()
        
        let vcArray = [onePageVC,classVC,bookVC,mineVC]
        
        for i in 0..<vcArray.count {
            addChildController(vcArray[i], title: titleArray[i][0], image: titleArray[i][1], selectedImage: titleArray[i][2])
        }
    }
    
    func addChildController(_ childController: UIViewController, title:String, image:String ,selectedImage:String) {
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: image)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(LBUNaviController(rootViewController: childController))
    }
    
}

extension LBUTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
