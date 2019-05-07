# XPhotoBrower
仿美团相册浏览器

###### 最近有个需求是要写一个类似美团的图片浏览器的效果,找来找去没有合适的,只能动手撸一个出来啦😆

###### 先上效果图

![demo的效果.png](https://upload-images.jianshu.io/upload_images/5243198-3d41a68eb4ff3b7e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![美团app的截图.jpeg](https://upload-images.jianshu.io/upload_images/5243198-ccf56f02f9a38e09.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 项目地址
[XPhotoBrowser]([https://github.com/LittleXu/XPhotoBrower](https://github.com/LittleXu/XPhotoBrower)
)

###### 使用方式

```
let vc = XPhotoBrowserController(titles: ["section 1", "section 2", "section 3", "section 4", "section 5"], imageUrls: [
                [
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2489492398,1961915359&fm=26&gp=0.jpg",
                    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1287814793,457485829&fm=26&gp=0.jpg",
                    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1934546302,3943652007&fm=26&gp=0.jpg",
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=293797082,429750698&fm=11&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=987398703,2891498258&fm=11&gp=0.jpg"
            ],
                [
                    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4096174413,3446359293&fm=11&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3156671389,2646079670&fm=26&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2518193085,2037234854&fm=11&gp=0.jpg",
                    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3220675614,2587066812&fm=11&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2779057000,405292963&fm=11&gp=0.jpg"
            ],
                [
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=968110288,1289415303&fm=11&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=521482729,3281324412&fm=11&gp=0.jpg",
                    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1166788581,3530207392&fm=11&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3387817653,1370165238&fm=11&gp=0.jpg",
                    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1021055753,305531416&fm=11&gp=0.jpg"
            ],
                [
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1898635837,2688761504&fm=11&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2283612859,2804137634&fm=26&gp=0.jpg",
                    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3599275367,544956226&fm=11&gp=0.jpg",
                    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2300646597,4098108273&fm=26&gp=0.jpg",
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1702164057,367487353&fm=26&gp=0.jpg"
            ],
                
                [
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=306756124,3158550936&fm=11&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1408455504,3668055581&fm=11&gp=0.jpg",
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3684049548,3267274478&fm=11&gp=0.jpg",
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2530288748,3595727388&fm=26&gp=0.jpg",
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1336525701,3725289584&fm=11&gp=0.jpg"
            ]
            ], imageIndexPath: IndexPath(item: 0, section: 0))
        present(vc, animated: false, completion: nil)
```

###### 部分代码
底部segment部分
```
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
```

###### 浏览器部分
```
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
```
