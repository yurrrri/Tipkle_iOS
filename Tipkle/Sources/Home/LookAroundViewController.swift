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
        self.showIndicator()
        homeDataManager.getCategoryFeed(viewController: self, categoryName: categoryName!, order: "recent", page:page)
    }
            
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (lookAroundCollectionView.contentOffset.y > (lookAroundCollectionView.contentSize.height - lookAroundCollectionView.bounds.size.height)){
            
            if (fetchingMore){
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
                self.page += 1
            
                self.showIndicator()
                self.homeDataManager.getCategoryFeed(viewController: self, categoryName: self.categoryName!, order: "recent", page:self.page)
                
                self.lookAroundCollectionView.reloadData()
            })
     }
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
