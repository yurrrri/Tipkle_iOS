//
//  TransitionNextViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit

class TransitionNextViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "화면 전환 닫기"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.backgroundColor = .yellow
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.backgroundColor = .green
    }
    
    // MARK: 네비게이션 컨트롤러를 이용한 뒤로가기
    @IBAction func navigationPopButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: modal 내리기
    @IBAction func dismissModalButtonTouchUpInside(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
