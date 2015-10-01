//
//  PostDetailInteractorIO.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

protocol PostDetailInteractorInput: class {
    func fetchPostWithId(postId: Int)
}

protocol PostDetailInteractorOutput: class {
    func postFetched(post: Post)
}