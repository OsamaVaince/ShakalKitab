//
//  CommentCellTableViewCell.swift
//  ShakalBook
//
//  Created by Osama Vaince on 8/4/21.
//

import UIKit

class CommentCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfUser: UILabel!
    @IBOutlet weak var postOfUser: UILabel!
    @IBOutlet weak var numberOfLikesForPost: UILabel!
    @IBOutlet weak var numberCommentsUsersPosted: UILabel!
    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    
   
}
