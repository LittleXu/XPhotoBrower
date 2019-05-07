//
//  XSegment.swift
//  CloudShopClient
//
//  Created by MacMini on 2019/5/6.
//  Copyright © 2019 京贝尔. All rights reserved.
//

import UIKit

private let base_tag = 1000

class XSegment: UIView {

    var selectIndexpath: IndexPath! {
        didSet {
            let sender = self.viewWithTag(base_tag + self.selectIndexpath.section)
            if sender != nil {
                scrollFlag = true
                buttonTappedAction(sender: sender as! UIButton)
            }
        }
    }
    
    private var scrollFlag = false
    private var titles: [String]!
    private var itemSelectAction: ((_ indexpath: IndexPath)->Void)?
    private var _x: CGFloat = 0
    
    /// 左右间距
    private let margin: CGFloat = 0
    private var space: CGFloat = 20
    
    private var scrollView: UIScrollView!
    
    convenience init(frame: CGRect, titles: [String], selectIndexpath: IndexPath, itemSelectAction:((_ indexpath: IndexPath)->Void)?) {
        self.init(frame: frame)
        self.titles = titles
        self.itemSelectAction = itemSelectAction
        self.selectIndexpath = selectIndexpath
        backgroundColor = UIColor.black
        setupScrollView()
        // 计算间距
        calculateSpace()
        setupViews()
    }
    
    private func setupScrollView() {
        let scroll = UIScrollView(frame: self.bounds)
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.bounces = false
        scroll.delegate = self
        addSubview(scroll)
        scrollView = scroll
    }
    
    private func setupViews() {
        _x = margin
        for (index, title) in titles.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            button.setTitleColor(UIColor.white, for: .selected)
            button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            button.tag = 1000 + index
            button.addTarget(self, action: #selector(buttonTappedAction(sender:)), for: .touchUpInside)
            let width = (title as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: self.frame.size.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], context: nil).size.width
            button.frame = CGRect(x: _x, y: 0, width: width + space * 2, height: self.frame.size.height)
            _x = _x + button.frame.size.width
            scrollView.addSubview(button)
            
            if index == selectIndexpath.section {
                button.isSelected = true
            }
        }
    }
    
    /// 计算
    private func calculateSpace() {
        var totalWidth = 2 * margin
        for title in titles {
            let width = (title as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: self.frame.size.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], context: nil).size.width
            totalWidth = totalWidth + width + 2 * space
        }
        
        
        
        if totalWidth < UIScreen.main.bounds.size.width {
            // 多出的部分
            let remainder = UIScreen.main.bounds.size.width - totalWidth
            // space应该增加的部分
            let showAdd = remainder / CGFloat(titles.count * 2)
            space = space + showAdd
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: self.frame.size.height)
        } else {
            scrollView.contentSize = CGSize(width: totalWidth, height: self.frame.size.height)
        }
    }
    
    
    // MARK: Events
    @objc private func buttonTappedAction(sender: UIButton) {
        for index in 0 ..< titles.count {
            let button = self.viewWithTag(index + base_tag) as! UIButton
            button.isSelected = false
        }
        sender.isSelected = true
        
        // 滚动到对应的位置
        var x = sender.frame.origin.x + sender.frame.size.width / 2.0 - UIScreen.main.bounds.size.width / 2.0
        if x < 0 {
            x = 0
        } else if x + UIScreen.main.bounds.size.width > scrollView.contentSize.width {
            x = scrollView.contentSize.width - UIScreen.main.bounds.size.width
        }
        
        scrollView.setContentOffset(CGPoint(x: x , y: 0), animated: true)
        
        var indexPath: IndexPath
        if scrollFlag {
            scrollFlag = false
            indexPath = selectIndexpath
        } else {
            indexPath = IndexPath(item: 0, section: sender.tag - base_tag)
        }
        
        if itemSelectAction != nil {
            itemSelectAction!(indexPath)
        }
    }
}

extension XSegment: UIScrollViewDelegate {
    
}
