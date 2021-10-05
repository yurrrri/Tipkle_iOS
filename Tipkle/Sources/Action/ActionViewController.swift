//
//  ActionViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit

class ActionViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "Action 메인"
    }
    
    // MARK: 화면 전환
    @IBAction func transitionButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.pushViewController(TransitionViewController(), animated: true)
    }
    
    // MARK: 인디케이터 (로딩)
    @IBAction func indicatorButtonTouchUpInside(_ sender: UIButton) {
        showIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismissIndicator()
        }
    }
    
    // MARK: 인디케이터 (커스텀 gif)
    @IBAction func gifIndicatorButtonTouchUpInside(_ sender: UIButton) {
        let containerView = UIView(frame: UIScreen.main.bounds)
        let activityIndicator = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 191.8, height: 85.2)))
        let images: [UIImage] = Array(0..<12).map{ UIImage(named: "bts\($0)")! }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.backgroundColor = .clear
        containerView.addSubview(activityIndicator)
        UIApplication.shared.windows.first?.addSubview(containerView)
        
        containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.4)
        activityIndicator.center = containerView.center
        activityIndicator.animationImages = images
        activityIndicator.animationDuration = Double(activityIndicator.animationImages?.count ?? 0) / 12
        activityIndicator.animationRepeatCount = 0
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            activityIndicator.stopAnimating()
            containerView.removeFromSuperview()
        }
    }
    
    // MARK: 경고창, 팝업 띄우기
    @IBAction func alertButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.pushViewController(AlertViewController(), animated: true)
    }
}
