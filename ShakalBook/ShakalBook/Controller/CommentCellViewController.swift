//
//  CommentCellViewController.swift
//  ShakalBook
//
//  Created by Osama Vaince on 8/4/21.
//

import UIKit
class CommentCellViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
    @IBOutlet weak var nameOfUserOfPost: UILabel!
    @IBOutlet weak var postOfUser: UILabel!
    @IBOutlet weak var likeLogo: UIImageView!
    @IBOutlet weak var amountOfComments: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var writeAComment: UITextField!
    @IBOutlet weak var likeOutSelected: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfUserOfPost.text = name
        postOfUser.text = post
        amountOfComments.text = "\(comments) Comments"
    }
   
    var name: String = ""
    var nameRecover: String = ""
    var post: String = ""
    var comments: Int = 0
    var count : Int = 0
    var commentResponseToPost: [Comment] = []
    
    @IBAction func toLikeAPost(_ sender: UIButton) {
        if count == 0 {
        likeOutSelected.isSelected = true
            likeLogo.isHidden = false
            count = count + 1
        } else if count == 1{
            likeOutSelected.isSelected = false
            count = count - 1
            likeLogo.isHidden = true
        }
    }
    @IBAction func toPostAComment(_ sender: UIButton) {
        amountOfComments.text = "\(comments) Comments"
        commentResponseToPost.append(Comment(name: nameRecover, comment: writeAComment.text ?? ""))
        commentTableView.reloadData()
        writeAComment.text = ""
        comments = comments + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commentResponseToPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Secondary", for: indexPath) as! SecondaryCommentTableViewCell
        cell.NameLabel.text = commentResponseToPost[indexPath.row].name
        cell.postLabel.text = commentResponseToPost[indexPath.row].comment
        return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
