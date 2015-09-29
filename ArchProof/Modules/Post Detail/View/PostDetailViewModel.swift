//
//  PostDetailViewModel.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

class PostDetailViewModel: NSObject {

    let id: String
    let userId: String
    let title: String
    let body: String
    
    init(id: String, userId: String, title: String, body: String) {
        self.id     = id
        self.userId = userId
        self.title  = title
        self.body   = body
    }
    
}
