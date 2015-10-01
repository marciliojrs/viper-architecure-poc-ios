//
//  PostsListInteractor.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

class PostsListInteractor: NSObject, PostsListInteractorInput {

    // MARK: - Properties -
    
    var dataManager: DataManagerInterface!
    weak var delegate: PostsListInteractorOutput?
    
    // MARK: - PostsListInteractorInput -
    
    func fetchPosts() {
        dataManager.fetchPosts { result in
            switch result {
            case .Success(let posts):
                self.delegate?.postsFetched(posts)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
}
