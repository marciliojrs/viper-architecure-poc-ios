//
//  PostDetailVC.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

class PostDetailVC: UIViewController, PostDetailInterface {

    // MARK: - Properties -
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var postId: Int?
    var presenter: PostDetailPresenter?
    
    // MARK: - View Life Cycle -
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.fetchPostWithId(postId!)
    }
    
    // MARK: - PostDetailInterface -
    
    func bindPost(post: PostDetailViewModel) {
        userIdLabel.text = post.userId
        idLabel.text     = post.id
        titleLabel.text  = post.title
        bodyLabel.text   = post.body
    }
    
}
