//
//  LookAroundViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/23.
//

import UIKit
import Kingfisher

class LookAroundViewController: UIViewController, UIScrollViewDelegate {

    private let cellID = "HomeLookAroundCollectionViewCell"

    lazy var homeDataManager = HomeDataManager()
    @IBOutlet weak var tvRecent: UILabel!
    @IBOutlet weak var lookAroundCollectionView: UICollectionView!
    @IBOutlet weak var tvPopular: UILabel!
    @IBOutlet weak var lookAroundBack: UIButton!
    var categoryName:String?=nil
    var feedList:[Feed] = [] //list
    var page = 1 //무한스크롤 페이지
    var fetchingMore = true //더 스크롤할지 여부
    
    @IBAction func tapbtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lookAroundCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: "lookaroundCell")

        lookAroundCollectionView.dataSource = self
        lookAroundCollectionView.delegate = self
    
        
        //navigation bar hide
        self.navigationController?.isNavigationBarHidden = true
        //button title 없애기
        lookAroundBack.setTitle("", for: .normal)
        
        // Do any additional setup after loading the view.
//        self.showIndicator()
//        homeDataManager.getCategoryFeed(viewController: self, categoryName: categoryName!, order: "recent", page:page)
        
        feedList = [Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F016661_1.jpeg?alt=media&token=50c88c02-8c82-4940-ab3c-b8bcaf1df903", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11120210805_131147.111?alt=media&token=38bf53a1-1514-4fbe-88c6-bc7a78421d79", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11220210725_220326.112?alt=media&token=f8c7ac93-0860-4572-9251-4053cf49c3fe"], isAuthor: "N"),
                    Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F13462ef1e98ec.jpeg?alt=media&token=10bacd5d-b538-483b-968b-1b2c93faaeae", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F202104190800020817_img_01.jpeg?alt=media&token=9abf9048-7bbb-40b2-a6e4-e6656c0ca460", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F5d814464240000c92b7d5545.jpeg?alt=media&token=eb8ead57-f5fd-49ac-aa8e-37e2620f1394"], isAuthor: "N"),
                    Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://console.firebase.google.com/u/8/project/tipkle-1c752/storage/tipkle-1c752.appspot.com/files/~2Fmedia", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C3.png?alt=media&token=e2bc438c-0f76-47b5-939f-1a793064a98f", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C2.jpeg?alt=media&token=319dfeff-d8ca-47c3-8e74-27e7542bdc49"], isAuthor: "N"),
                    Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F016661_1.jpeg?alt=media&token=50c88c02-8c82-4940-ab3c-b8bcaf1df903", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11120210805_131147.111?alt=media&token=38bf53a1-1514-4fbe-88c6-bc7a78421d79", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11220210725_220326.112?alt=media&token=f8c7ac93-0860-4572-9251-4053cf49c3fe"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F13462ef1e98ec.jpeg?alt=media&token=10bacd5d-b538-483b-968b-1b2c93faaeae", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F202104190800020817_img_01.jpeg?alt=media&token=9abf9048-7bbb-40b2-a6e4-e6656c0ca460", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F5d814464240000c92b7d5545.jpeg?alt=media&token=eb8ead57-f5fd-49ac-aa8e-37e2620f1394"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://console.firebase.google.com/u/8/project/tipkle-1c752/storage/tipkle-1c752.appspot.com/files/~2Fmedia", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C3.png?alt=media&token=e2bc438c-0f76-47b5-939f-1a793064a98f", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C2.jpeg?alt=media&token=319dfeff-d8ca-47c3-8e74-27e7542bdc49"], isAuthor: "N"),
                    Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F016661_1.jpeg?alt=media&token=50c88c02-8c82-4940-ab3c-b8bcaf1df903", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11120210805_131147.111?alt=media&token=38bf53a1-1514-4fbe-88c6-bc7a78421d79", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11220210725_220326.112?alt=media&token=f8c7ac93-0860-4572-9251-4053cf49c3fe"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F13462ef1e98ec.jpeg?alt=media&token=10bacd5d-b538-483b-968b-1b2c93faaeae", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F202104190800020817_img_01.jpeg?alt=media&token=9abf9048-7bbb-40b2-a6e4-e6656c0ca460", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F5d814464240000c92b7d5545.jpeg?alt=media&token=eb8ead57-f5fd-49ac-aa8e-37e2620f1394"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://console.firebase.google.com/u/8/project/tipkle-1c752/storage/tipkle-1c752.appspot.com/files/~2Fmedia", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C3.png?alt=media&token=e2bc438c-0f76-47b5-939f-1a793064a98f", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C2.jpeg?alt=media&token=319dfeff-d8ca-47c3-8e74-27e7542bdc49"], isAuthor: "N"),
                    Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F016661_1.jpeg?alt=media&token=50c88c02-8c82-4940-ab3c-b8bcaf1df903", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11120210805_131147.111?alt=media&token=38bf53a1-1514-4fbe-88c6-bc7a78421d79", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11220210725_220326.112?alt=media&token=f8c7ac93-0860-4572-9251-4053cf49c3fe"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F13462ef1e98ec.jpeg?alt=media&token=10bacd5d-b538-483b-968b-1b2c93faaeae", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F202104190800020817_img_01.jpeg?alt=media&token=9abf9048-7bbb-40b2-a6e4-e6656c0ca460", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F5d814464240000c92b7d5545.jpeg?alt=media&token=eb8ead57-f5fd-49ac-aa8e-37e2620f1394"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://console.firebase.google.com/u/8/project/tipkle-1c752/storage/tipkle-1c752.appspot.com/files/~2Fmedia", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C3.png?alt=media&token=e2bc438c-0f76-47b5-939f-1a793064a98f", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C2.jpeg?alt=media&token=319dfeff-d8ca-47c3-8e74-27e7542bdc49"], isAuthor: "N"),
                    Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F016661_1.jpeg?alt=media&token=50c88c02-8c82-4940-ab3c-b8bcaf1df903", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11120210805_131147.111?alt=media&token=38bf53a1-1514-4fbe-88c6-bc7a78421d79", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11220210725_220326.112?alt=media&token=f8c7ac93-0860-4572-9251-4053cf49c3fe"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F13462ef1e98ec.jpeg?alt=media&token=10bacd5d-b538-483b-968b-1b2c93faaeae", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F202104190800020817_img_01.jpeg?alt=media&token=9abf9048-7bbb-40b2-a6e4-e6656c0ca460", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F5d814464240000c92b7d5545.jpeg?alt=media&token=eb8ead57-f5fd-49ac-aa8e-37e2620f1394"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://console.firebase.google.com/u/8/project/tipkle-1c752/storage/tipkle-1c752.appspot.com/files/~2Fmedia", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C3.png?alt=media&token=e2bc438c-0f76-47b5-939f-1a793064a98f", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C2.jpeg?alt=media&token=319dfeff-d8ca-47c3-8e74-27e7542bdc49"], isAuthor: "N"),
                    Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F016661_1.jpeg?alt=media&token=50c88c02-8c82-4940-ab3c-b8bcaf1df903", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11120210805_131147.111?alt=media&token=38bf53a1-1514-4fbe-88c6-bc7a78421d79", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11220210725_220326.112?alt=media&token=f8c7ac93-0860-4572-9251-4053cf49c3fe"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F13462ef1e98ec.jpeg?alt=media&token=10bacd5d-b538-483b-968b-1b2c93faaeae", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F202104190800020817_img_01.jpeg?alt=media&token=9abf9048-7bbb-40b2-a6e4-e6656c0ca460", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F5d814464240000c92b7d5545.jpeg?alt=media&token=eb8ead57-f5fd-49ac-aa8e-37e2620f1394"], isAuthor: "N"),
                                Feed(postId: 1, userId: 1, nickName: "엘리", profileImgUrl: "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F11020210725_220326.110?alt=media&token=1b531968-622e-450d-993f-47b0f26657b6", whenText: "일본 여행갈 때", howText: "일본 여행 꿀템 소개", description: "일본 여행가면 무조건 사야하는 꿀템을 소개할게요! 1. 동전파스 2. 카베진 알파 3. 도쿄바나나 4. 아사히 맥주 큰캔", score: "5.0", star: 5, createdAt: "", imgUrl: ["https://console.firebase.google.com/u/8/project/tipkle-1c752/storage/tipkle-1c752.appspot.com/files/~2Fmedia", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C3.png?alt=media&token=e2bc438c-0f76-47b5-939f-1a793064a98f", "https://firebasestorage.googleapis.com/v0/b/tipkle-1c752.appspot.com/o/media%2F%ED%99%94%EC%9E%A5%EC%8B%A4%20%ED%83%80%EC%9D%BC%20%EC%B2%AD%EC%86%8C2.jpeg?alt=media&token=319dfeff-d8ca-47c3-8e74-27e7542bdc49"], isAuthor: "N")
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
            
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (lookAroundCollectionView.contentOffset.y > (lookAroundCollectionView.contentSize.height - lookAroundCollectionView.bounds.size.height)){
//
//            if (fetchingMore){
//                beginBatchFetch()
//            }
//        }
//    }
//
//    func beginBatchFetch() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
//                self.page += 1
//
//                self.showIndicator()
//                self.homeDataManager.getCategoryFeed(viewController: self, categoryName: self.categoryName!, order: "recent", page:self.page)
//
//                self.lookAroundCollectionView.reloadData()
//            })
//     }
}
        

extension LookAroundViewController{
    func didSuccessGetFeed(_ result: [Feed]){
        self.dismissIndicator()

        if (page==1 && feedList.isEmpty){ //맨 처음
            feedList = result
            lookAroundCollectionView.reloadData()
        }
        else if (page != 1 && result.isEmpty){ //비었을때 그만 불러오기
            fetchingMore = false
        }
        else{
            feedList.append(contentsOf: result)
            lookAroundCollectionView.reloadData()
        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

extension LookAroundViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = lookAroundCollectionView.dequeueReusableCell(withReuseIdentifier: "lookaroundCell", for: indexPath) as! HomeLookAroundCollectionViewCell
        
        cell.tvNickName.text = feedList[indexPath.row].nickName
        
        //kingfisher를 이용하여 round image 만드는 방법
//        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 50, height: 50)) |> RoundCornerImageProcessor(cornerRadius: cell.imgLookAround.frame.width/2)
//
        cell.imgLookAround.kf.setImage(with: URL(string: feedList[indexPath.row].profileImgUrl), placeholder: UIImage(systemName: "photo"), options:.none)
        cell.imgLookAround.layer.cornerRadius = cell.imgLookAround.frame.height / 2
        cell.imgLookAround.clipsToBounds = true
        
        cell.tvWhen.text = feedList[indexPath.row].whenText
        cell.tvHow.text = feedList[indexPath.row].howText
        cell.tvDescription.text = feedList[indexPath.row].description
        
        cell.rating.text = feedList[indexPath.row].score
        cell.rating.rating = Double(feedList[indexPath.row].star)
        
        cell.feedimageList = feedList[indexPath.row].imgUrl
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        
        return CGSize(width: width, height: collectionView.frame.height*0.76)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HomeFeedDetailViewController()
        vc.postId = feedList[indexPath.row].postId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
