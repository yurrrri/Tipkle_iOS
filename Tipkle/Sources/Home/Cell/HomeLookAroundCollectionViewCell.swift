//
//  HomeLookAroundCollectionViewCell.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/23.
//

import UIKit
import Cosmos
import Kingfisher

class HomeLookAroundCollectionViewCell: UICollectionViewCell {

    private let cellID = "HomeLookAroundImageCollectionViewCell"

    @IBOutlet weak var tvWhenTitle: UILabel!
    @IBOutlet weak var tvWhen: UILabel!
    @IBOutlet weak var tvHowTitle: UILabel!
    @IBOutlet weak var tvHow: UILabel!
    @IBOutlet weak var tvDescription: UILabel!
    @IBOutlet weak var imgLookAround: UIImageView!
    @IBOutlet weak var tvNickName: UILabel!
    @IBOutlet weak var lookAroundSecondTableView: UICollectionView!
    @IBOutlet weak var rating: CosmosView!
    var feedimageList:[String] = []
    private let spacing:CGFloat = 8.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//// ui setting
        tvWhenTitle.textColor = UIColor.mint
        tvHowTitle.textColor = UIColor.mint
        tvWhen.textColor = UIColor.darkMint
        tvWhen.font = UIFont.NotoSans(.regular, size: 16)
        tvHow.textColor = UIColor.darkMint
        tvHow.font = UIFont.NotoSans(.regular, size: 16)
        
        tvDescription.font = UIFont.NotoSans(.regular, size: 14)
        rating.settings.emptyColor = UIColor.grayDB
        rating.settings.emptyBorderColor = UIColor.grayDB
        rating.settings.filledColor = UIColor.mint
        rating.settings.filledBorderColor = UIColor.mint
        rating.settings.textColor = UIColor.mint
        
        lookAroundSecondTableView.delegate = self
        lookAroundSecondTableView.dataSource = self
        
        lookAroundSecondTableView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: "lookaroundimageCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.lookAroundSecondTableView?.collectionViewLayout = layout
    }
    
    override func prepareForReuse() {
        lookAroundSecondTableView.reloadData()
    }
}

extension HomeLookAroundCollectionViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedimageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = lookAroundSecondTableView.dequeueReusableCell(withReuseIdentifier: "lookaroundimageCell", for: indexPath) as! HomeLookAroundImageCollectionViewCell
        
        cell.image.kf.setImage(with: URL(string: feedimageList[indexPath.row]), placeholder: UIImage(systemName: "photo"), options: .none)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 3 //1줄에 보여줄 아이템의 개수
        let spacingBetweenCells:CGFloat = 8 //아이템간 간격
        let totalSpacing = ((numberOfItemsPerRow-1) * spacingBetweenCells) //토탈 간격
    
        let width = (collectionView.frame.width - totalSpacing)/numberOfItemsPerRow
        
        return CGSize(width: width, height: collectionView.frame.height)
    }
}
