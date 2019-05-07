//
//  XPhotoBrowserController.swift
//  CloudShopClient
//
//  Created by MacMini on 2019/5/6.
//  Copyright © 2019 京贝尔. All rights reserved.
//

import UIKit

private let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
private let diff: CGFloat = (statusBarHeight == 44 ? 34 : 0)

private let XPhotoBrowserControllerCellID = "XPhotoBrowserControllerCellID"

class XPhotoBrowserController: UIViewController {
    private var titles: [String]!
    private var imageUrls: [[String]]!
    private var imageIndexPath: IndexPath!
    
    private var collectionView: UICollectionView!
    private var segments: XSegment!
    private var titleL: UILabel!
    private var indexL: UILabel!
    
    convenience init(titles: [String], imageUrls: [[String]], imageIndexPath: IndexPath) {
        self.init()
        self.titles = titles
        self.imageUrls = imageUrls
        self.imageIndexPath = imageIndexPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.black
        
        // 底部segment
        segments = XSegment(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - diff - 40, width: UIScreen.main.bounds.size.width, height: 40), titles: titles!, selectIndexpath: imageIndexPath, itemSelectAction: { [weak self] indexpath in
            self?.collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: false)
            self?.titleL.text = self?.titles[indexpath.section]
            self?.indexL.text = String(indexpath.item + 1) + "/" + String(self?.imageUrls[indexpath.section].count ?? 0)
        })
        view.addSubview(segments)
        
        // 底部细线
        let line = UIView(frame: CGRect(x: 0, y: segments.frame.origin.y - 1 / UIScreen.main.scale, width: UIScreen.main.bounds.size.width, height: 1 / UIScreen.main.scale))
        line.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.addSubview(line)
        
        // collectionView
        let collectionViewSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - diff - segments.frame.size.height - line.frame.size.height - statusBarHeight)
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = collectionViewSize
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: statusBarHeight), size: collectionViewSize), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(XCollectionViewCell.self, forCellWithReuseIdentifier: XPhotoBrowserControllerCellID)
        view.addSubview(collectionView)
        
        // 返回按钮
        let backB = UIButton(frame: CGRect(x: 0, y:statusBarHeight , width: 44, height: 44))
        backB.setImage(UIImage(named: "nav-back-white"), for: .normal)
        backB.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backB)
        
        // 图片标题
        titleL = UILabel()
        titleL.text = "标题"
        titleL.textColor = UIColor.white
        titleL.font = UIFont.boldSystemFont(ofSize: 15)
        titleL.sizeToFit()
        titleL.frame = CGRect(x: 15, y: line.frame.origin.y - 32 - titleL.frame.size.height, width: UIScreen.main.bounds.size.width / 2 - 15, height: titleL.frame.size.height)
        view.addSubview(titleL)
        
        //
        indexL = UILabel()
        indexL.text = "0/0"
        indexL.textColor = UIColor.white.withAlphaComponent(0.5)
        indexL.font = UIFont.systemFont(ofSize: 10)
        indexL.textAlignment = .right
        indexL.sizeToFit()
        indexL.frame = CGRect(x: UIScreen.main.bounds.size.width / 2, y: titleL.frame.origin.y, width: titleL.frame.size.width, height: indexL.frame.size.height)
        view.addSubview(indexL)
        
        collectionView.scrollToItem(at: imageIndexPath, at: .centeredHorizontally, animated: false)
        titleL.text = titles[imageIndexPath.section]
        indexL.text = String(imageIndexPath.item + 1) + "/" + String(imageUrls[imageIndexPath.section].count)
    }
    
    @objc private func back() {
        self.dismiss(animated: false, completion: nil)
    }
    

}

extension XPhotoBrowserController: UICollectionViewDelegate {
    
}

extension XPhotoBrowserController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: XPhotoBrowserControllerCellID, for: indexPath) as! XCollectionViewCell
        cell.imageUrl = imageUrls[indexPath.section][indexPath.item]
        return cell
    }
}

extension XPhotoBrowserController: UICollectionViewDelegateFlowLayout {
    
}

extension XPhotoBrowserController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let cells = collectionView.visibleCells
        let cell = cells.first as! XCollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)
        titleL.text = titles[indexPath?.section ?? 0]
        indexL.text = String((indexPath?.item ?? 0) + 1) + "/" + String(imageUrls[indexPath?.section ?? 0].count)
        if indexPath?.section != segments.selectIndexpath.section {
            segments.selectIndexpath = indexPath
        }
        
    }
}
