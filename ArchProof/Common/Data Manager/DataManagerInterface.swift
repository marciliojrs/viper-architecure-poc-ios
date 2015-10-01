//
//  DataManagerInterface.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

protocol DataManagerInterface {
    
    func fetchPosts(completion: APIResult<[Post]> -> Void)
 
    func fetchPostWithId(postId: Int, completion: APIResult<Post> -> Void)
    
}
