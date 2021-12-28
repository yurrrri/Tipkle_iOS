//
//  HomeLookAroundCollectionViewCell.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/23.
//

import UIKit
import Cosmos

class HomeLookAroundCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tvWhenTitle: UILabel!
    @IBOutlet weak var tvWhen: UILabel!
    @IBOutlet weak var tvHowTitle: UILabel!
    @IBOutlet weak var tvHow: UILabel!
    @IBOutlet weak var tvDescription: UILabel!
    @IBOutlet weak var imgLookAround: UIImageView!
    @IBOutlet weak var tvNickName: UILabel!
    @IBOutlet weak var lookAroundSecondTableView: UICollectionView!
    @IBOutlet weak var rating: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
// ui setting
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
    }

}
