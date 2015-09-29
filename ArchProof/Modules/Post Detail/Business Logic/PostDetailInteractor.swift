//
//  PostDetailInteractor.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

class PostDetailInteractor: NSObject, PostDetailInteractorInput {

    // MARK: - Properties -
    
    var dataManager: DataManagerInterface?
    weak var delegate: PostDetailInteractorOutput?
    
    // MARK: - PostDetailInteractorInput -
    
    func fetchPostWithId(postId: Int) {
        dataManager?.fetchPostWithId(postId, completion: { (post) in
            self.delegate?.postFetched(post)
            return
        })
    }
}
