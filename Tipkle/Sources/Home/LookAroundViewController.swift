//
//  LookAroundViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/23.
//

import UIKit
import Kingfisher

class LookAroundViewController: UIViewController {

    private let cellID = "HomeLookAroundCollectionViewCell"

    lazy var homeDataManager = HomeDataManager()
    @IBOutlet weak var tvRecent: UILabel!
    @IBOutlet weak var lookAroundCollectionView: UICollectionView!
    @IBOutlet weak var tvPopular: UILabel!
    @IBOutlet weak var lookAroundBack: UIButton!
    var categoryName:String?=nil
    var feedList:[Feed] = []
    
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
        homeDataManager.getCategoryFeed(viewController: self, categoryName: categoryName!, order: "recent")
    }
}

extension LookAroundViewController{
    func didSuccessGetFeed(_ result: [Feed]){
        self.dismissIndicator()

        feedList = result
        lookAroundCollectionView.reloadData()
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
        
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 50, height: 50)) |> RoundCornerImageProcessor(cornerRadius: cell.imgLookAround.frame.width/2)
        
        cell.imgLookAround.kf.setImage(with: URL(string: feedList[indexPath.row].profileImgUrl), placeholder: UIImage(systemName: "photo"), options:[.processor(processor)])
        
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
}
