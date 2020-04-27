//
//  LBUBookController.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUBookController: LBUPageController {
    
    private lazy var topList = [LBUTopModel]()
    private lazy var rankList = [LBURankingModel]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(cellType: LBURankCollectionViewCell.self)
        collectionView.register(cellType: LBUTopCollectionViewCell.self)
        collectionView.uHead = URefreshHeader { [weak self] in  self?.setupLoadData() }
        collectionView.uempty = UEmptyView { [weak self] in self?.setupLoadData() }
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLoadData()
    }
    
    private func setupLoadData() {
        ApiLoadingProvider.request(LBUApi.cateList, model: LBUCateListModel.self) { (returnData) in
            self.collectionView.uempty?.allowShow = true
            self.topList = returnData?.topList ?? []
            self.rankList = returnData?.rankingList ?? []
            
            self.collectionView.reloadData()
            self.collectionView.uHead?.endRefreshing()
        }
    }
    
    
    
    override func setupLayout() {
//        super.setupLayout()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.usnp.edges)
        }
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
    }

}

extension LBUBookController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
//            return topList.prefix(3).count
            return 5
        } else {
            return rankList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: LBUTopCollectionViewCell.self)
//            cell.model = topList[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: LBURankCollectionViewCell.self)
            cell.model = rankList[indexPath.row]
            return cell 
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: section == 0 ? 0 : 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 40.0) / 3.0)
        return CGSize(width: width, height: (indexPath.section == 0 ? 55 : (width * 0.75 + 30)))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
