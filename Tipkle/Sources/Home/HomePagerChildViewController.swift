//
//  HomePagerChildViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/07.
//

import UIKit
import Foundation
import ImageSlideshow
import Kingfisher

private let cellID = "HomeCollectionViewCell"

class HomePagerChildViewController: UIViewController {
    
    lazy var homeDataManager  = HomeDataManager()
    
    @IBOutlet weak var bannerTitle: UILabel!
    @IBOutlet weak var viewLookAround: UIView!
    @IBOutlet weak var homeViewCurrent: UILabel!
    @IBOutlet weak var homeViewPopular: UILabel!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var tvRecentTip: UILabel!
    @IBOutlet weak var tvPopularTip: UILabel!
    
    var categoryName = ""
    
    var height:CGFloat = 0.0
    var width:CGFloat = 0.0
    
    var bannerTitles:[String] = []
    var homeTipCount = 0
    var homeTipArray:[GetPreview] = []
    
    
    @IBOutlet weak var homeTopBannerSlide: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        height = view.frame.size.height
        width = view.frame.size.width

        homeTopBannerSlide.contentScaleMode = .scaleAspectFill
        bannerTitle.layer.zPosition = 999 //맨위로 올라가도록
        
        homeTopBannerSlide.currentPageChanged = { page in
            self.bannerTitle.text = self.bannerTitles[page]
        }
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        // 3.2 UITableviewCell을 테이블 뷰에 등록한다.
        //private let cellID = "TableViewCell"
        homeCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: "cell")
        
        let recentTipGesture = UITapGestureRecognizer(target: self, action: #selector(tvRecentTipTapped))
        tvRecentTip.addGestureRecognizer(recentTipGesture)
        
        let popularTipGesture = UITapGestureRecognizer(target: self, action: #selector(tvPopularTipTapped))
        
        tvPopularTip.addGestureRecognizer(popularTipGesture)
        
        let lookAroundTapped = UITapGestureRecognizer(target: self, action: #selector(lookAroundTapped))
        viewLookAround.addGestureRecognizer(lookAroundTapped)
    }
    
    @objc func tvRecentTipTapped(sender: UITapGestureRecognizer) {
        tvPopularTip.font = UIFont.NotoSans(.regular, size: 16)
        tvPopularTip.textColor = .gray97
        
        tvRecentTip.font = UIFont.NotoSans(.bold, size: 16)
        tvRecentTip.textColor = .black
        
        self.showIndicator()
        homeDataManager.getPreviewTips(viewController: self, categoryName: self.categoryName, order: "recent")
        
    }
    
    @objc func tvPopularTipTapped(sender: UITapGestureRecognizer) {
        self.showIndicator()
        tvRecentTip.font = UIFont.NotoSans(.regular, size: 16)
        tvRecentTip.textColor = .gray97
        
        tvPopularTip.font = UIFont.NotoSans(.bold, size: 16)
        tvPopularTip.textColor = .black
        
        homeDataManager.getPreviewTips(viewController: self, categoryName: self.categoryName, order: "popular")
    }
    
    @objc func lookAroundTapped(sender: UITapGestureRecognizer) {
        let vc = LookAroundViewController()
        vc.categoryName = categoryName
        self.parent?.navigationController?.pushViewController(vc, animated: true)
    
        print("hi")
    }
}

extension HomePagerChildViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //collectionview cell의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeTipCount
    }
    
    //어떻게 보이는가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        //라운딩처리
        cell.tvTitle.text = homeTipArray[indexPath.row].title
        cell.imgTip.layer.cornerRadius = 4
        cell.imgTip.clipsToBounds = true
                
        cell.imgTip.kf.setImage(with: URL(string: homeTipArray[indexPath.row].thumbnailUrl), placeholder: UIImage(systemName: "photo"), options:.none)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //기기 사이즈 대응
        // in case you you want the cell to be 40% of your controllers view
        return CGSize(width: collectionView.frame.size.width/2-6, height: height*(0.41 - 0.06))
    }
}

extension HomePagerChildViewController{
    func didSuccessGetPreviewTips(_ result: [GetPreview]){
        self.dismissIndicator()
        homeTipArray = result
        self.homeCollectionView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
