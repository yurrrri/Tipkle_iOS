//
//  HomeViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/03.
//

import UIKit
import PanModal

class HomeViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var homepagerchildViewControllerTitles:[String] = []
    var homepagerchildViewControllers:[HomePagerChildViewController] = []
    lazy var homeDataManager = HomeDataManager()
    @IBAction func btnChooseCategory(_ sender: Any) {
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = HomeCategoryBottomSheetViewController()
        
        // MDC 바텀 시트로 설정
//        vc.modalPresentationStyle = .pageSheet
        
//        if #available(iOS 15.0, *) {
//            if let sheet = vc.sheetPresentationController{
//                sheet.detents = [.medium(), .large()]
//            }
//        } else {
//            // Fallback on earlier versions
//            // 이전 버전은 라이브러리
            self.presentPanModal(vc)
//        }
        
//        present(vc, animated: true, completion: nil)
    }
    
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
