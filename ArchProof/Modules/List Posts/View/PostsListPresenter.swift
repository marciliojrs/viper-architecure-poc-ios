//
//  PostsListPresenter.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

class PostsListPresenter: NSObject, PostsListInteractorOutput {

    // MARK: - Properties -
    
    var interactor: PostsListInteractorInput?
    weak var listWireframe: PostsListWireframe?
    weak var interface: PostsListVC?

    // MARK: - Public Methods -
    
    func updateView() {
        interactor?.fetchPosts()
    }
    
    // MARK: - PostsListInteractorOutput -
    
    func postsFetched(posts: [Post]) {
        var rows = [PostsListViewModel]()
        
        for post in posts {
            let postViewModel = PostsListViewModel(id: post.id, userId: post.userId, title: post.title, body: post.body)
            
            rows.append(postViewModel)
        }
        
        interface?.tableViewData = rows
        interface?.reloadData()
    }
    
}
