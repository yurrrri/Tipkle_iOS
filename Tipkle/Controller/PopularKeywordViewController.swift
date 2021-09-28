//
//  TipListViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/09/28.
//

import UIKit

class PopularKeywordViewController: UIViewController {
    
    @IBOutlet weak var popularKeywordCV: UICollectionView!
    
    //1. 데이터 리스트 준비
    var popularkeywordList = [
        PopularKeyword(rank: 1, keyword: "장마철 빨래"),
        PopularKeyword(rank: 2, keyword: "장마철 빨래"),
        PopularKeyword(rank: 3, keyword: "장마철 빨래"),
        PopularKeyword(rank: 4, keyword: "장마철 빨래"),
        PopularKeyword(rank: 5, keyword: "장마철 빨래"),
        PopularKeyword(rank: 6, keyword: "장마철 빨래"),
        PopularKeyword(rank: 7, keyword: "장마철 빨래"),
        PopularKeyword(rank: 8, keyword: "장마철 빨래"),
        PopularKeyword(rank: 9, keyword: "장마철 빨래"),
    ]
    
    //2. 컬렉션뷰 아웃렛

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate, datasource 등록
        self.popularKeywordCV.delegate = self
        self.popularKeywordCV.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PopularKeywordViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                           UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularkeywordList.count
    }
    
    //셀에 어떻게 보여줄 것인가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularKeywordCell", for: indexPath) as? PopularKeywordCell else {
            return UICollectionViewCell()
        }
      
        cell.tvKeyword.text = popularkeywordList[indexPath.row].keyword
        cell.tvRank.text = String(popularkeywordList[indexPath.row].rank)

        return cell
    }
    
//    //아이템간 가로 간격 설정하는 부분
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 16;
//    }

    //아이템간 세로 간격 설정하는 부분
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 36;
//    }
    
    //셀의 사이즈 -> collectionView가 매개변수로 들어옴
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width:CGFloat = collectionView.frame.size.width //frame의 사이즈와 동일하게 -> 한줄로 표시
        let height:CGFloat = 40
        
        return CGSize(width: width, height: height)
    }
    
    
    //셀 선택했을때의 동작
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
//    }
}

class PopularKeywordCell : UICollectionViewCell{

    @IBOutlet weak var tvRank: UILabel!
    @IBOutlet weak var tvKeyword: UILabel!
}
