//
//  PostsListInteractor.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

class PostsListInteractor: NSObject, PostsListInteractorInput {

    var dataManager: DataManagerInterface!
    weak var delegate: PostsListInteractorOutput?
    
    func fetchPosts() {
        dataManager.fetchPosts { (posts) in
            self.delegate?.postsFetched(posts)
            return
        }
    }
    
}
