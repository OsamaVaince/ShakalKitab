//
//  CommentFeedViewController.swift
//  ShakalBook
//
//  Created by Osama Vaince on 8/4/21.
//

import UIKit

class CommentFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var newsFeedData: [PostModel] = [
        PostModel(name: "Daniyal Khan", post: "Aik maasomana sawal hai?", likes: 25, comment: [Comment(name: "Arfhan Ahmad", comment: "Ji sir, kiya sawaal hai"), Comment(name: "Zain Ahmed", comment: "Android walay sawaal ka jawab nahi hai meray paas bhai"), Comment(name: "Harris Ali", comment: "Kitnay maasoomana sawal karo ge bhai???")]),
        PostModel(name: "Arfhan Ahmad", post: "Aik task aanay wali hai", likes: 2, comment: [Comment(name: "Daniyal Khan", comment: "Ya allah khair"), Comment(name: "Harris Ali", comment: "Usko bolo wapis jaye!")]),
        PostModel(name: "Zain Ahmed", post: "Who is ready for some homework?", likes: 1, comment: [Comment(name: "Momina Khan", comment: "Not me!"), Comment(name: "Daniyal Khan", comment: "I'm ready, I love doing homeworks"), Comment(name: "Khawer Ahmed", comment: "I agree with Daniyal"), Comment(name: "Basit Chaudhary", comment: "I agree as well!"), Comment(name: "Fawad Akhtar", comment: "Same here!"), Comment(name: "Osama Vaince", comment: "You guys are a bunch of nerds, who likes homework??")]),
        PostModel(name: "Imran Khan", post: "Tabdeeli ai gi nai, Tabdeeli aa gaye hai!", likes: 146, comment: [Comment(name: "Nawaz Sharif", comment: "Nahiiiii!"), Comment(name: "Random Aunty", comment: "Imran Khan I love you!"), Comment(name: "Osama Vaince", comment: "Go Niazi Go!"), Comment(name: "Daniyal Khan", comment: "Imran Khan is the best!"), Comment(name: "Arfhan Ahmad", comment: "Please resign kar dei sir!")]),
        PostModel(name: "Nawaz Sharif", post: "Mujhe Kiyu Nikala?????", likes: 159, comment: [Comment(name: "Imran Khan", comment: "GO NAWAZ GO!"), Comment(name: "Maryam Nawaz", comment: "I agree with dad!"), Comment(name: "Osama Vaince", comment: "Sir aap ke sath acha nahi hua"), Comment(name: "Arfhan Ahmad", comment: "Sir you need to come back, Pakistan needs you!")]),
        PostModel(name: "Narendra Modi", post: "I will attack Pakistan!", likes: 15, comment: [Comment(name: "Imran Khan", comment: "ok, aajao"), Comment(name: "United Nations", comment: "Gentleman, please stop fighting."), Comment(name: "Imran Khan", comment: "Be quiet UN, you are pretty useless anyways!"), Comment(name: "Narendra Modi", comment: "I agree with you on that one Khan sahab."), Comment(name: "Jammu Kashmir", comment: "Can you guys stop fighting and please leave me alone")]),
        PostModel(name: "Salman Khan", post: "I am releasing a new movie this Eid!", likes: 358, comment: [Comment(name: "Osama Vaince", comment: "Please Retire from bollywood, you're too old"), Comment(name: "Ali Ahmed", comment: "Yess, Salman bhai can't wait to watch it!"), Comment(name: "Arfhan Ahmad", comment: "Will it have action in it?"), Comment(name: "Zain Ahmed", comment: "Who is the actress??")]),
        PostModel(name: "Shahrukh Khan", post: "I am probably the best bollywwood actor of all time!", likes: 798, comment: [Comment(name: "Salman Khan", comment: "No I am!"), Comment(name: "Amitabh Bachchan", comment: "Calm down kids, stop fighting. Im obviously the best here"), Comment(name: "Dilip Kumar", comment: "Look at all these kids, I was the best when your grandfathers were still wearing diapers"), Comment(name: "Shahrukh Khan", comment: "No doubt about that sir, you truly are the best!"), Comment(name: "Amitabh Bachchan", comment: "I agree with Shahrukh")]),
        PostModel(name: "Donald Trump", post: "Im running for Presidential Elections in 2024", likes: 876, comment: [Comment(name: "Joseph Biden", comment: "Donald please, can you pleas let me be a president in peace!"), Comment(name: "Nancy Pelosi", comment: "Oh no, please dont"), Comment(name: "Mike Pence", comment: "Yes sir, can I be your VP again?"), Comment(name: "Donald Trump", comment: "No mike, not after what you did to me last time. I did not forget that"), Comment(name: "Mike Pence", comment: "Please, sir please. I wont do that again")]),
        PostModel(name: "Joseph Biden", post: "Can someone tell me how I can block a person on here?", likes: 827, comment: [Comment(name: "Kamala Harris", comment: "Who did you want to block Joey?"), Comment(name: "Joseph Biden", comment: "Donald Trump LOL!"), Comment(name: "Kamala Harris", comment: "LMFAOOOO!"), Comment(name: "Donald Trump", comment: "Not cool Joe!")])]
    
    var nameOfUser = ""
    var post = ""
    var likes = 0
    var com = 0
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var whatsOnYourMind: UITextField!
    
    @IBAction func postButton(_ sender: UIButton) {
        if whatsOnYourMind.hasText {
            post = whatsOnYourMind.text ?? ""
            newsFeedData.append(PostModel(name: nameOfUser, post: post, likes: likes, comment: [Comment(name: "", comment: "")]))
            whatsOnYourMind.text = ""
            
        } else {
//        post = whatsOnYourMind.text ?? ""
        performSegue(withIdentifier: "NoPost", sender: self)
//        newsFeedData.append(PostModel(name: nameOfUser, post: post, likes: likes, comment: [Comment(name: "", comment: "")]))
//        whatsOnYourMind.text = ""
//        tableView.reloadData()
            
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! CommentCellTableViewCell
        cell.nameOfUser.text = newsFeedData[indexPath.row].name
        cell.postOfUser.text = newsFeedData[indexPath.row].post
        cell.numberOfLikesForPost.text = "\((newsFeedData[indexPath.row].likes)) Likes"
        cell.numberCommentsUsersPosted?.text = "\(newsFeedData[indexPath.row].comment.count) Comments"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "Comments") as! CommentCellViewController
        vc.name = newsFeedData[indexPath.row].name
        vc.post = newsFeedData[indexPath.row].post
        vc.commentResponseToPost = newsFeedData[indexPath.row].comment
        vc.nameRecover = nameOfUser
        vc.comments = newsFeedData[indexPath.row].comment.count
        navigationController?.pushViewController(vc, animated: true)
    
    }
}
