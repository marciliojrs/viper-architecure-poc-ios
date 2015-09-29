//
//  PostsListViewModel.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

class PostsListViewModel: NSObject {
    
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    init(id: Int, userId: Int, title: String, body: String) {
        self.id     = id
        self.userId = userId
        self.title  = title
        self.body   = body
    }
    
}
