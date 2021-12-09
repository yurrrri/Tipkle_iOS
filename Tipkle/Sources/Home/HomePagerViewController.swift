//
//  HomePagerViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/07.
//

import UIKit
import Tabman
import Pageboy

class HomePagerViewController: TabmanViewController {
    lazy var homeDataManager = HomeDataManager()
    var viewControllers: [UIViewController] = []
    var viewControllerTitles: [String] = []
    let bar = TMBar.ButtonBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.isScrollEnabled = false //swipe 막기
        
        // Create bar
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .blur(style: .light)
        bar.indicator.tintColor = UIColor.mint //indicator 색
        bar.layout.contentMode = .fit //나눠서 꽉채워줌
        bar.buttons.customize{ //클릭했을때오 안했을때의 색깔 설정
            (button) in
            button.tintColor = UIColor.gray97
            button.selectedTintColor = UIColor.mint
        }
        //add bar to view
        addBar(bar, dataSource: self, at: .top)
    }
}

extension HomePagerViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = viewControllerTitles[index]
                                            
        return item
    }
}
