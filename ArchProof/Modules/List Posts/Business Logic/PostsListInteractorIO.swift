//
//  PostsListInteractorIO.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

protocol PostsListInteractorInput : class {
    func fetchPosts()
}

protocol PostsListInteractorOutput : class {
    func postsFetched(posts: [Post])
}
