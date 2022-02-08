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
    override func viewDidLoad() {
        super.viewDidLoad()

        //버튼
        btnApply.setTitleColor(.white, for: .normal)
        btnApply.titleLabel?.font = UIFont.NotoSans(.bold, size: 18)
        btnApply.backgroundColor = UIColor.mint
        
        btnApply.setNeedsDisplay()
    
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
