//
//  PostDetailWireframe.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

class PostDetailWireframe: NSObject {

    // MARK: - Properties -
    
    var postDetailViewController: PostDetailVC?
    
    func pushToDetailView(postId: Int, fromNavigationController navigationController: UINavigationController) {
        
        postDetailViewController!.postId = postId
        navigationController.pushViewController(postDetailViewController!, animated: true)
        
    }
    
}
