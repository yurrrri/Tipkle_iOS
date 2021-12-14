//
//  HomePagerChildViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/07.
//

import UIKit
import ImageSlideshow

class HomePagerChildViewController: UIViewController {
    
    @IBOutlet weak var bannerTitle: UILabel!
    @IBOutlet weak var viewLookAround: UIView!
    @IBOutlet weak var homeViewCurrent: UILabel!
    @IBOutlet weak var homeViewPopular: UILabel!
    
    var bannerTitles:[String] = []
    @IBOutlet weak var homeTopBannerSlide: ImageSlideshow!
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTopBannerSlide.contentScaleMode = .scaleAspectFill
        bannerTitle.layer.zPosition = 999 //맨위로 올라가도록
        
        homeTopBannerSlide.currentPageChanged = { page in
            self.bannerTitle.text = self.bannerTitles[page]
        }
    }
}
