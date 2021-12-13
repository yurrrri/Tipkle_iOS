//
//  HomePagerViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/07.
//

import UIKit
import Tabman
import Pageboy
import ImageSlideshowKingfisher

class HomePagerViewController: TabmanViewController {
    var selectedIndex = -1
    lazy var homeDataManager = HomeDataManager()
    var viewControllers: [HomePagerChildViewController] = []
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
    
    //클릭했을때의 동작 실행
    //여기서 API 불러오기
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: TabmanViewController.PageIndex, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        
        //배너얻어오기
        selectedIndex = index //클릭한 인덱스
        self.showIndicator()
        homeDataManager.getBanner(viewController: self)
    }
}

extension HomePagerViewController {
    func didSuccessGetBanner(_ result: [GetBanner]){
        self.dismissIndicator()
        var imageSources:[KingfisherSource] = []
        for i in result{
            imageSources.append(KingfisherSource(urlString: i.thumbnailUrl, placeholder: UIImage(systemName: "photo"), options: .none)!)
        }
        viewControllers[selectedIndex].homeTopBannerSlide.setImageInputs(imageSources)
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
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
