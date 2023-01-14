//
//  HomeLookAroundImageCollectionViewCell.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/29.
//

import UIKit

class HomeLookAroundImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib(){
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.image.image = nil
    }
}
