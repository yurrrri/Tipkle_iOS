//
//  NetworkViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit

class NetworkViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "Network 메인"
    }
    
    @IBAction func signInButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @IBAction func searchMovieButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.pushViewController(BoxOfficeViewController(), animated: true)
    }
}
