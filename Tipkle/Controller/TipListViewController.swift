//
//  TipListViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/09/28.
//

import UIKit

class TipListViewController: UIViewController {

    //1. 데이터 리스트 준비
    var lookAroundtipList = [
        LookAroundTip(when: "계란이 바닥에 깨졌을 때", how: "밀가루를 바닥에 뿌려 닦아낸다", description:"밀가루를 바닥에 뿌려 닦아낸다밀가루를 바닥에 뿌려 닦아낸다"),
        LookAroundTip(when: "운동화 끈이 자주 풀릴때", how: "리본으로 묶는방법", description:"밀가루를 바닥에 뿌려 닦아낸다밀가루를 바닥에 뿌려 닦아낸다"),
        LookAroundTip(when: "계란이 바닥에 깨졌을 때", how: "밀가루를 바닥에 뿌려 닦아낸다", description:"밀가루를 바닥에 뿌려 닦아낸다밀가루를 바닥에 뿌려 닦아낸다"),
        LookAroundTip(when: "운동화 끈이 자주 풀릴때", how: "리본으로 묶는방법", description:"밀가루를 바닥에 뿌려 닦아낸다밀가루를 바닥에 뿌려 닦아낸다"),
        LookAroundTip(when: "계란이 바닥에 깨졌을 때", how: "밀가루를 바닥에 뿌려 닦아낸다", description:"밀가루를 바닥에 뿌려 닦아낸다밀가루를 바닥에 뿌려 닦아낸다"),
        LookAroundTip(when: "운동화 끈이 자주 풀릴때", how: "리본으로 묶는방법", description:"밀가루를 바닥에 뿌려 닦아낸다밀가루를 바닥에 뿌려 닦아낸다"),
    ]
    
    //2. 컬렉션뷰 아웃렛
    @IBOutlet weak var lookAroundCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate, datasource 등록
        self.lookAroundCollectionView.delegate = self
        self.lookAroundCollectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TipListViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                           UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lookAroundtipList.count
    }
    
    //셀에 어떻게 보여줄 것인가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lookAroundTipCell", for: indexPath) as? lookAroundTipCell else {
            return UICollectionViewCell()
        }
        cell.tvWhen.text = lookAroundtipList[indexPath.row].when
        cell.tvHow.text = lookAroundtipList[indexPath.row].how
        cell.tvDescription.text =
            lookAroundtipList[indexPath.row].description
        return cell
    }
    
//    //아이템간 가로 간격 설정하는 부분
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 16;
//    }
//
    //아이템간 세로 간격 설정하는 부분
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 36;
    }
    
    //셀의 사이즈 -> collectionView가 매개변수로 들어옴
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width:CGFloat = collectionView.frame.size.width //frame의 사이즈와 동일하게 -> 한줄로 표시
        let height:CGFloat = collectionView.frame.size.height * 0.767
        
        return CGSize(width: width, height: height)
    }
    
    
    //셀 선택했을때의 동작
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
//    }
}

class lookAroundTipCell : UICollectionViewCell{
    @IBOutlet weak var tvHow: UILabel!
    @IBOutlet weak var tvWhen: UILabel!
    @IBOutlet weak var tvDescription: UILabel!
}
