//
//  PostsListPresenter.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import PKHUD

class PostsListPresenter: NSObject, PostsListInteractorOutput {

    // MARK: - Properties -
    
    var interactor: PostsListInteractorInput?
    weak var listWireframe: PostsListWireframe?
    weak var detailWireframe: PostDetailWireframe?
    weak var interface: PostsListInterface?

    // MARK: - Public Methods -
    
    func updateView() {
        interface?.showHUD()
        interactor?.fetchPosts()
    }
    
    func handleCellSelection(post: PostsListViewModel) {
        listWireframe?.presentPostDetailWireframe(post.id)
    }
    
    // MARK: - PostsListInteractorOutput -
    
    func postsFetched(posts: [Post]) {
        var rows = [PostsListViewModel]()
        
        for post in posts {
            let postViewModel = PostsListViewModel(id: post.id, userId: post.userId, title: post.title, body: post.body)
            
            rows.append(postViewModel)
        }
        
        interface?.dismissHUD()
        interface?.setTableViewData(rows)
        interface?.reloadData()
    }
    
}
