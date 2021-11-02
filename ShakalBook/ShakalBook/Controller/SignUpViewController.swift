//
//  SignUpViewController.swift
//  ShakalBook
//
//  Created by Osama Vaince on 8/4/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
//    var nameOfUser = "Osama"

    @IBOutlet weak var shakalKitabLogo: UIImageView!
    
    @IBOutlet weak var shakalKitabUserName: UITextField!
    
    @IBOutlet weak var shakalKitabPassword: UITextField!
    
    @IBAction func sigunUpButton(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "NewsFeed")as! CommentFeedViewController
        vc.nameOfUser = shakalKitabUserName.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
}
