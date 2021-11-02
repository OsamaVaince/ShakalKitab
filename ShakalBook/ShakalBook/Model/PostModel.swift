//
//  PostModel.swift
//  ShakalBook
//
//  Created by Osama Vaince on 8/4/21.
//

import Foundation
class PostModel {
    var name: String
    var post: String
    var likes: Int
    var comment: [Comment]
    init(name: String, post: String, likes: Int, comment: [Comment]) {
        self.name = name
        self.post = post
        self.likes = likes
        self.comment = comment
    }
    
}
