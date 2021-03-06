//
//  HomeFeedDetailViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2022/02/15.
//

import UIKit
import ImageSlideshow
import Kingfisher
import ImageSlideshowKingfisher
import Cosmos
import PanModal

class HomeFeedDetailViewController: UIViewController {

    lazy var homeDataManager = HomeDataManager()
    var postId = 0
    var imageSources:[KingfisherSource] = []
    var isPostedStar = false
    
    @IBOutlet weak var feedDetailImageSlide: ImageSlideshow!
    @IBOutlet weak var feedDetailBookMark: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var feedDetailBack: UIButton!
    @IBOutlet weak var separateLine: UIView!
    @IBOutlet weak var feedDetailStars: CosmosView!
    @IBOutlet weak var whenTitle: UILabel!
    @IBOutlet weak var howTitle: UILabel!
    @IBOutlet weak var whenText: UILabel!
    @IBOutlet weak var howText: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var commentBackgroundView: UIView!
    @IBOutlet weak var tvRatingStar: UILabel!
    @IBOutlet weak var tvCommentCount: UILabel!
    @IBOutlet weak var tvNickName: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var btnComment: UIImageView!
    
    @IBAction func btnStarTapped(_ sender: Any) {
        let vc = RatingAlertViewController()
        vc.postId = postId
        // 뷰 컨트롤러가 보여지는 스타일
        vc.modalPresentationStyle = .overCurrentContext
        // 뷰 컨트롤러가 사라지는 스타일)
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)  // 생성
    }
    
    
    //뒤로가기
    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        // tabbar가 자연스럽게 없어지게 하기 위한 부분 추가
        self.tabBarController?.tabBar.isTranslucent = true
        
        feedDetailImageSlide.contentScaleMode = .scaleToFill
        
        feedDetailBookMark.layer.zPosition = 999
        feedDetailBack.layer.zPosition = 999
        feedDetailBack.clipsToBounds = true
        
        feedDetailStars.settings.emptyColor = UIColor.grayDB
        feedDetailStars.settings.emptyBorderColor = UIColor.grayDB
        feedDetailStars.settings.filledColor = UIColor.mint
        feedDetailStars.settings.filledBorderColor = UIColor.mint
        feedDetailStars.settings.textColor = UIColor.mint
        
        whenText.textColor = UIColor.mint
        howText.textColor = UIColor.mint
        whenTitle.textColor = UIColor.mint
        howTitle.textColor = UIColor.mint
        
        separateLine.backgroundColor = UIColor.grayDB
        
        if (isPostedStar){
            btnStar.setImage(UIImage(named: "ic_star_line"), for: .normal)
        }
        
//        commentBackgroundView.layer.shadowOpacity = 0.04
//        commentBackgroundView.layer.shadowOffset = CGSize(width:commentBackgroundView.frame.width, 0)
//        commentBackgroundView
        
        self.showIndicator()
        homeDataManager.getFeedDetail(viewController: self, postId: postId)
    
        let imgCommentTap = UITapGestureRecognizer(target: self, action: #selector(imgCommentTapped))
        btnComment.addGestureRecognizer(imgCommentTap)
    }
    
    @objc func imgCommentTapped(sender: UITapGestureRecognizer) {
        let bottomSheet = HomeCommentBottomSheet()
        bottomSheet.postId = postId
        self.presentPanModal(bottomSheet)
    }
}

extension HomeFeedDetailViewController{
    func didSuccessGetFeedDetail(_ result: GetFeedDetailResult){
        self.dismissIndicator()
        imageSources = [KingfisherSource(urlString: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%EB%B0%A9%EC%B6%A9%EB%A7%9D%20%EC%B2%AD%EC%86%8C1.png?alt=media&token=b59aaa9a-d658-4704-b6ba-472177f781b6", placeholder: UIImage(systemName: "photo"), options: .none)!, KingfisherSource(urlString: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%EB%B0%A9%EC%B6%A9%EB%A7%9D%20%EC%B2%AD%EC%86%8C1.png?alt=media&token=b59aaa9a-d658-4704-b6ba-472177f781b6", placeholder: UIImage(systemName: "photo"), options: .none)!]
            feedDetailImageSlide.setImageInputs(imageSources)
        imgProfile.kf.setImage(with: URL(string:"https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2FKakaoTalk_Photo_2021-08-05-12-26-06.jpeg?alt=media&token=615fb11f-a886-4f5b-8459-ae8ecdc9a896"), placeholder: UIImage(systemName: "photo"), options:.none)
        imgProfile.layer.cornerRadius = imgProfile.frame.height / 2
        imgProfile.clipsToBounds = true
        tvNickName.text = result.nickName!
        feedDetailStars.text = result.score!
        whenText.text = result.whenText!
        howText.text = result.howText!
        mainText.text = "꿀팁 테스트"
        tvRatingStar.text = result.score!
        tvCommentCount.text = String(result.commentCount!)
        if (result.isStarred!=="Y"){
            btnStar.setImage(UIImage(named: "ic_star_color"), for: .normal)
        }
    }
    
    func failedToRequest(message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}
