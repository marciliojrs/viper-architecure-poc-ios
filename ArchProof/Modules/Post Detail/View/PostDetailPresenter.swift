//
//  PostDetailPresenter.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

class PostDetailPresenter: NSObject, PostDetailInteractorOutput {

    // MARK: - Properties -
    
    var interactor: PostDetailInteractorInput?
    weak var interface: PostDetailInterface?
    weak var wireframe: PostDetailWireframe?
    
    // MARK: - Public Methods -
    
    func fetchPostWithId(postId: Int) {
        interface?.showHUD()
        interface?.bindPost(nil)
        interactor?.fetchPostWithId(postId)
    }
    
    // MARK: - PostDetailInteractorOutput - 
    
    func postFetched(post: Post) {
        let postViewModel = PostDetailViewModel(id: "Id: \(post.id)",
            userId: "Usuário: \(post.userId)",
            title: "Título: \(post.title)",
            body: post.body)
        
        interface?.bindPost(postViewModel)
        
        interface?.dismissHUD()
    }
    
}
