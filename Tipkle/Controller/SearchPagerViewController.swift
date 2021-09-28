//
//  HomePagerChildViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/09/24.
//

import UIKit
import Tabman
import Pageboy

class SearchPagerViewController: TabmanViewController {
    private var viewControllers: Array<UIViewController> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popularVC") as! PopularKeywordViewController
        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popularVC") as! PopularKeywordViewController


        viewControllers.append(vc)
        viewControllers.append(vc2)

        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.backgroundColor = .white
        bar.indicator.tintColor = UIColor(named:"mint")
        bar.layout.contentMode = .fit //나눠서 꽉채워줌
        bar.buttons.customize{ //클릭했을때오 안했을때의 색깔 설정
            (button) in
            button.selectedTintColor = UIColor(named:"mint")
            button.tintColor = UIColor(named:"black")
        }

        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
}

extension SearchPagerViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        // MARK: -Tab 안 글씨들
        switch index {
        case 0:
            return TMBarItem(title: "인기 검색어")
        default:
            return TMBarItem(title: "최근 검색어")
        }
        
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
