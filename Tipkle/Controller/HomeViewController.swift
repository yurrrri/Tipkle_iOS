//
//  ViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/09/24.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        // change selected bar color
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //탭 아이템을 구성하는 부분
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let clean = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier : "homeChildVC") as! HomePagerChildViewController

//        let jachi = UIStoryboard.init(name: "자취", bundle: nil).instantiateViewController(withIdentifier: "homeChildVC") as! HomePagerChildViewController
//
//        jachi.tabName = "자취"

        return [clean]
    }
}
