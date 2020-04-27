//
//  LBUHomeSubscibeController.swift
//  ManHua
//
//  Created by Soul on 26/11/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit

class LBUHomeSubscibeController: LBUBaseController {
    private var subscribeList = [LBUComicListModel]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UCollectionViewSectionBackgroundLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.background
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(cellType: LBUComicCollectionViewCell.self)
        collectionView.register(supplementaryViewType: LBUComicCollectionHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader)
        collectionView.register(supplementaryViewType: LBUComicCollectionFooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
        collectionView.uHead = URefreshHeader { [weak self] in self?.setupLoadData() }
        collectionView.uFoot = URefreshTipKissFooter(with: "使用妖气币可以购买订阅漫画\nVIP会员购买还有优惠哦~")
        collectionView.uempty = UEmptyView { [weak self] in self?.setupLoadData() }
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadData()
    }
    
    private func setupLoadData() {
        ApiLoadingProvider.request(LBUApi.subscribeList, model: LBUSubscribeListModel.self) { (returnData) in
            self.collectionView.uHead?.endRefreshing()
            self.collectionView.uempty?.allowShow = true
            
            self.subscribeList = returnData?.newSubscribeList ?? []
            self.collectionView.reloadData()
        }
    }
    
    override func setupLayout() {
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
    }
}

extension LBUHomeSubscibeController: UCollectionViewSectionBackgroundLayoutDelegateLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return subscribeList.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        return UIColor.cyan
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let comicList = subscribeList[section]
        return comicList.comics?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let comicList = subscribeList[section]
        return comicList.itemTitle?.count ?? 0 > 0 ? CGSize(width: screenWidth, height: 44) : CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return subscribeList.count - 1 != section ? CGSize(width: screenWidth, height: 10) : CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 10.0) / 3.0)
        return CGSize(width: width, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let head = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath, viewType: LBUComicCollectionHeaderView.self)
            let comicList = subscribeList[indexPath.section]
            head.iconView.kf.setImage(urlString: comicList.titleIconUrl)
            head.titleLabel.text = comicList.itemTitle
            head.moreButton.isHidden = !comicList.canMore
            head.moreActionClosure { [weak self] in
                let vc = LBUComicListController(argCon: comicList.argCon, argName: comicList.argName, argValue: comicList.argValue)
                vc.title = comicList.itemTitle
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return head
        } else {
            let food = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: indexPath, viewType: LBUComicCollectionFooterView.self)
            return food
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: LBUComicCollectionViewCell.self)
        cell.cellStyle = .withTitle
        let comicList = subscribeList[indexPath.section]
        cell.model = comicList.comics?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comicList = subscribeList[indexPath.section]
        guard let model = comicList.comics?[indexPath.row] else { return }
        let vc = LBUComicController(comicid: model.comicId)
        navigationController?.pushViewController(vc, animated: true)
    }
}
