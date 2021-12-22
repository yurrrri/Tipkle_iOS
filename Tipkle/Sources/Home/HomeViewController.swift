//
//  HomeViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var homepagerchildViewControllerTitles:[String] = []
    var homepagerchildViewControllers:[HomePagerChildViewController] = []
    lazy var homeDataManager = HomeDataManager()
    
    override func viewDidLoad() {
        // containerview
        self.showIndicator()
        homeDataManager.getUserCategories(viewController: self)
        }
}

extension HomeViewController {
    func didSuccessGetUserCategories(_ result: [GetUserCategoryResult]){
        self.dismissIndicator()
        
        for i in result{
            let vc = HomePagerChildViewController()
            vc.categoryName = i.categoryName
            homepagerchildViewControllerTitles.append(i.categoryName)
            homepagerchildViewControllers.append(vc)
        }
        
        let vc = HomePagerViewController() //상단 탭 컨트롤러에 데이터 넘기기
        vc.viewControllerTitles = homepagerchildViewControllerTitles
        vc.viewControllers = homepagerchildViewControllers
                
        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        vc.view.frame = self.containerView.bounds
        //containerViewController에 childViewController가 등록되었을 때 호출되는 메소드
        vc.didMove(toParent: self)
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
