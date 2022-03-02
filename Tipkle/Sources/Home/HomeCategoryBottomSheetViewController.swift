//
//  HomeCategoryBottomSheetViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2022/02/08.
//

import UIKit
import PanModal

class HomeCategoryBottomSheetViewController: UIViewController {

    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnClean: UIButton!
    @IBOutlet weak var btnCook: UIButton!
    @IBOutlet weak var btnJachi: UIButton!
    @IBOutlet weak var btnTrip: UIButton!
    @IBOutlet weak var btnUniv: UIButton!
    @IBOutlet weak var btnBeauty: UIButton!
    lazy var homeDataManager = HomeDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //버튼
        btnApply.setTitleColor(.white, for: .normal)
        btnApply.titleLabel?.font = UIFont.NotoSans(.bold, size: 18)
        btnApply.backgroundColor = UIColor.mint
        
        btnApply.setNeedsDisplay()
        
        self.showIndicator()
        homeDataManager.getUserCategories(viewController: self)
    
    }
}

extension HomeCategoryBottomSheetViewController: PanModalPresentable {

    // 스크롤되는 tableview 나 collectionview 가 있다면 여기에 넣어주면 PanModal 이 모달과 스크롤 뷰 사이에서 팬 제스처를 원활하게 전환합니다.
    var panScrollable: UIScrollView? {
        return nil
    }

    var shortFormHeight: PanModalHeight {
        return .contentHeight(552)
    }

    var longFormHeight: PanModalHeight {
        return .contentHeight(552)
    }
    
}

extension HomeCategoryBottomSheetViewController {
    func didSuccessGetUserCategories(_ result: [GetUserCategoryResult]){
        self.dismissIndicator()
        for i in result{
            switch i.categoryName {
            case "청소" :
                btnClean.setImage(UIImage(named: "check_box_color"), for: .normal)
                break
            case "요리" :
                btnCook.setImage(UIImage(named: "check_box_color"), for: .normal)
                break
            case "자취" :
                btnJachi.setImage(UIImage(named: "check_box_color"), for: .normal)
                break
            case "여행" :
                btnTrip.setImage(UIImage(named: "check_box_color"), for: .normal)
                break
            case "대학" :
                btnUniv.setImage(UIImage(named: "check_box_color"), for: .normal)
                break
            default:
                btnBeauty.setImage(UIImage(named: "check_box_color"), for: .normal)
                break
            }
        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
