//
//  ViewController.swift
//  XPhotoBrowserDemo
//
//  Created by MacMini on 2019/5/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func showBrowser(_ sender: Any) {
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
    }
    
}

