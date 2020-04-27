//
//  LBUReadCollectionViewCell.swift
//  ManHua
//
//  Created by Soul on 15/12/2019.
//  Copyright © 2019 Soul. All rights reserved.
//

import UIKit
import Kingfisher

// 设置占位图
extension UIImageView: Placeholder {}

class LBUReadCollectionViewCell: LBUBaseCollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var placeholder: UIImageView = {
        let placeholder = UIImageView(image: UIImage(named: "yaofan"))
        placeholder.contentMode = .center
        return placeholder
    }()
    
    override func setupLayout() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in make.edges.equalToSuperview() }
    }
    
    var model: LBUImageModel? {
        didSet {
            guard let model = model else { return }
            imageView.image = nil
            imageView.kf.setImage(urlString: model.location, placeholder: placeholder)
            imageView.kf.setImage(urlString: model.location)
        }
    }
}
