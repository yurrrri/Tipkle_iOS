//
//  HomePagerChildViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/09/24.
//

import UIKit
import Tabman
import Pageboy

class HomePagerChildViewController: TabmanViewController {
    private var viewControllers: Array<UIViewController> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cleanVC") as! CleanViewController
            
        viewControllers.append(vc)
        
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.backgroundColor = .white
        bar.indicator.tintColor = UIColor(named:"mint")
        bar.layout.contentMode = .fit //나눠서 꽉채워줌
        bar.buttons.customize{ //클릭했을때오 안했을때의 색깔 설정
            (button) in
            button.tintColor = .black
            button.tintColor = UIColor(named:"mint")
        }

        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
}

extension HomePagerChildViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = "청소"
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
