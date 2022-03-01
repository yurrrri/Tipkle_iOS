//
//  RatingAlertViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2022/02/22.
//

import UIKit
import Cosmos

class RatingAlertViewController: UIViewController {

    @IBOutlet weak var ratingBar: CosmosView!
    var postId = 1
    lazy var homeDataManager = HomeDataManager()
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func confirm(_ sender: Any) {
        self.showIndicator()
        let star = Int(ratingBar.rating)
        homeDataManager.postStar(PostRatingStarRequest(star: star), viewController: self, postId: postId)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(hex: 0x000000, alpha: 0.5)
        ratingBar.settings.emptyColor = UIColor.grayDB
        ratingBar.settings.emptyBorderColor = UIColor.grayDB
        ratingBar.settings.filledColor = UIColor.mint
        ratingBar.settings.filledBorderColor = UIColor.mint
        ratingBar.settings.textColor = UIColor.mint
        
        let countStars = 5.0
        ratingBar.settings.starMargin = 12
        ratingBar.settings.starSize = Double( (ratingBar.frame.width/countStars)-(ratingBar.settings.starMargin)) //star size gonna stretch with the width of the ratingbar
    }

}

extension RatingAlertViewController{
    func didPostStarSuccess(_ result: BaseResponse){
        self.dismissIndicator()
        if (result.isSuccess){
            let vc = HomeFeedDetailViewController()
            vc.isPostedStar = true
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.presentAlert(title: "서버와의 연결이 원활하지 않습니다")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func failedToRequest(message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}
