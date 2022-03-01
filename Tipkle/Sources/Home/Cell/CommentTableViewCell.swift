//
//  CommentTableViewCell.swift
//  Tipkle
//
//  Created by 이유리 on 2022/03/01.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfileComment: UIImageView!
    @IBOutlet weak var tvCommentNickname: UILabel!
    @IBOutlet weak var tvCommentContent: UILabel!
    @IBOutlet weak var tvCommentHour: UILabel!
    @IBOutlet weak var btnCommentEdit: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tvCommentHour.textColor = .grayDB
        imgProfileComment.layer.cornerRadius = imgProfileComment.frame.height / 2
        imgProfileComment.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
