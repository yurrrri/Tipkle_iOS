//
//  MyPageViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/02.
//

import UIKit
import Kingfisher

class MyPageViewController: UIViewController {

    @IBOutlet weak var myBackgroundView: UIView!
    @IBOutlet weak var myProfile: UIImageView!
    @IBOutlet weak var myNickName: UILabel!
    @IBOutlet weak var myLevel: UIImageView!
    @IBOutlet weak var myLevelName: UILabel!
    @IBOutlet weak var myAchievement: UILabel!
    @IBOutlet weak var myLogout: UIView!
    //    @IBOutlet weak var topBackground: UIView!
    
    lazy var myDataManager = MyDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myBackgroundView.backgroundColor = UIColor.mint
        self.tabBarController?.tabBar.barTintColor = UIColor.white
//        topBackground.backgroundColor = UIColor.mint
        
        self.showIndicator()
        myDataManager.getMyPage(viewController: self)
    }
}

extension MyPageViewController {
    func didSuccessGetUserMyPage(_ result: GetMyPageResult){
        
        self.dismissIndicator()
        myProfile.kf.setImage(with: URL(string: result.profileImgUrl), placeholder: UIImage(systemName: "photo"), options:.none)
        myNickName.text = result.nickName
        myLevel.image = UIImage(named: "Lv1_40%")
        myLevelName.text = result.levelName
        myAchievement.text = result.achievement

    }
    
    func didSuccessLogout(_ result: BaseResponse){
        
        self.dismissIndicator()
        UserDefaults.standard.set("", forKey: "jwt")
        self.present(LoginViewController(), animated: true, completion: nil)
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

