//
//  HomePagerChildViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/07.
//

import UIKit
import ImageSlideshow

class HomePagerChildViewController: UIViewController {
    
    @IBOutlet weak var viewLookAround: UIView!
    @IBOutlet weak var homeViewCurrent: UILabel!
    @IBOutlet weak var homeViewPopular: UILabel!
    @IBOutlet weak var homeTopBannerSlide: ImageSlideshow!
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTopBannerSlide.contentScaleMode = .scaleAspectFill
        homeTopBannerSlide.pageIndicator = LabelPageIndicator()
        homeTopBannerSlide.pageIndicatorPosition = PageIndicatorPosition(horizontal: .left(padding:24), vertical: .customBottom(padding: 20))

    }
}
