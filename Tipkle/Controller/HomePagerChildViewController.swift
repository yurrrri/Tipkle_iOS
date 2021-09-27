//
//  HomePagerChildViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/09/24.
//

import UIKit
import XLPagerTabStrip

class HomePagerChildViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var lookAroundView: UIView!
    
    
    var tabName:String=""
    //데이터 리스트 준비
    var homeTipList = [
        HomeTip(image: UIImage(named: "image (4)")!, title: "[청소] 계란이 바닥에 깨졌을 때 청소 TIP"),
        HomeTip(image: UIImage(named: "image (6)")!, title: "[청소] 화장실 악취 제거하는 방법 3가지"),
        HomeTip(image: UIImage(named: "image (4)")!, title: "[청소] 계란이 바닥에 깨졌을 때 청소 TIP"),
        HomeTip(image: UIImage(named: "image (6)")!, title: "[청소] 화장실 악취 제거하는 방법 3가지"),
        HomeTip(image: UIImage(named: "image (4)")!, title: "[청소] 계란이 바닥에 깨졌을 때 청소 TIP"),
        HomeTip(image: UIImage(named: "image (6)")!, title: "[청소] 화장실 악취 제거하는 방법 3가지"),
        HomeTip(image: UIImage(named: "image (4)")!, title: "[청소] 계란이 바닥에 깨졌을 때 청소 TIP"),
        HomeTip(image: UIImage(named: "image (6)")!, title: "[청소] 화장실 악취 제거하는 방법 3가지"),
    ]
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title:"\(tabName)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate, datasource 등록
        self.homeCollectionView.delegate = self
        self.homeCollectionView.dataSource = self
                
        // 3.2 UITableviewCell을 테이블 뷰에 등록한다.
        //homeCollectionView.register(UINib(nibName: "cell", bundle: nil), forCellWithReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
        // Touch Event 등록 후 함수를 연동한다. (goPage)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(goPage(sender:)))

        self.lookAroundView.addGestureRecognizer(gesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func goPage(sender:UIGestureRecognizer){

        // Story board 상수를 지정하고 (Main.storyboard 기 때문에 "Main"을 입력해주자.)
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tipListVC")

        self.navigationController!.pushViewController(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HomePagerChildViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                           UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeTipList.count
    }
    
    //셀에 어떻게 보여줄 것인가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? tipCell else {
            return UICollectionViewCell()
        }
        cell.imgView.image = homeTipList[indexPath.row].image
        cell.tvTip.text = homeTipList[indexPath.row].title
        return cell
    }
    
//    //아이템간 가로 간격 설정하는 부분
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 16;
//    }
//
    //아이템간 세로 간격 설정하는 부분
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20;
    }
    
    //셀의 사이즈 -> collectionView가 매개변수로 들어옴
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width:CGFloat = collectionView.frame.width/2 - 8 //한 줄에 2개를 출력하고싶을때
        let height:CGFloat = width+72
        
        return CGSize(width: width, height: height)
    }
    
    
    //셀 선택했을때의 동작
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}

class tipCell:UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tvTip: UILabel!
}
