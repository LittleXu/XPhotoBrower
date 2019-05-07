//
//  XCollectionViewCell.swift
//  CloudShopClient
//
//  Created by MacMini on 2019/5/6.
//  Copyright © 2019 京贝尔. All rights reserved.
//

import UIKit
import Kingfisher
class XCollectionViewCell: UICollectionViewCell {
    
    var imageUrl: String? {
        didSet {
            imageV.kf.setImage(with: URL(string: self.imageUrl ?? ""), placeholder: UIImage(named: "暂无图片"))
        }
    }
    
    private var imageV: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageV = UIImageView(frame: self.bounds)
        imageV.contentMode = .scaleAspectFit
        addSubview(imageV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
