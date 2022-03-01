//
//  HomeCommentBottomSheet.swift
//  Tipkle
//
//  Created by 이유리 on 2022/03/01.
//

import UIKit
import PanModal
import Kingfisher
import ImageSlideshowKingfisher

class HomeCommentBottomSheet: UIViewController {

    lazy var homeDataManager = HomeDataManager()
    var postId = 0
    var commentList:[Comment] = []
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        // Do any additional setup after loading the view.
        self.showIndicator()
        homeDataManager.getFeedComment(viewController: self, postId: 1)
    }
    
}

extension HomeCommentBottomSheet: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.tvCommentHour.text = commentList[indexPath.row].createdAt
        cell.tvCommentContent.text = commentList[indexPath.row].content
        cell.tvCommentNickname.text = commentList[indexPath.row].nickName
        cell.imgProfileComment.kf.setImage(with: URL(string: commentList[indexPath.row].profileImgUrl), placeholder: UIImage(systemName: "photo"))
        if (commentList[indexPath.row].isAuthor == "N"){
            cell.btnCommentEdit.isHidden = true
        }
        
        
        return cell
    }
    
}

extension HomeCommentBottomSheet: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return .none
    }
    
    var shortFormHeight: PanModalHeight{
        return .intrinsicHeight
    }
    
    var longFormHeight: PanModalHeight{
        return .maxHeight
    }
}

extension HomeCommentBottomSheet{
    func getCommentSuccess(_ result: [Comment]){
        self.dismissIndicator()
        commentCount.text = String(result.count)
        commentList = result
        commentTableView.reloadData()
       
    }
    
    func failedToRequest(message: String) {
        self.dismissIndicator()
        self.presentAlert(title: message)
    }
}
