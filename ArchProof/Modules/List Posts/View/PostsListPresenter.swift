//
//  PostsListPresenter.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

class PostsListPresenter: NSObject {

    var interactor: PostsListInteractorInput?
    weak var listWireframe: PostsListWireframe?
    weak var interface: PostsListVC?

    func updateView() {
        interactor?.fetchPosts()
    }
    
}
