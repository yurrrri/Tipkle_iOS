//
//  BaseViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit

//모든 뷰컨트롤러에서 공통적으로 들어가는 부분
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 아래 예시들처럼 상황에 맞게 활용하시면 됩니다.
        // Navigation Bar
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            .font : UIFont.NotoSans(.medium, size: 16),
//        ]
        // Background Color
        self.view.backgroundColor = .white
    }
}
