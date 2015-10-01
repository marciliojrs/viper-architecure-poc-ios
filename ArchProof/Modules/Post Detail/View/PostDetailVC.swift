//
//  PostDetailVC.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import PKHUD

class PostDetailVC: UIViewController, PostDetailInterface {

    // MARK: - Properties -
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var postId: Int?
    var presenter: PostDetailPresenter?
    
    // MARK: - View Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureHUD()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.fetchPostWithId(postId!)
    }
    
    // MARK: - PostDetailInterface -
    
    func bindPost(post: PostDetailViewModel?) {
        guard let post = post else {
            userIdLabel.text = ""
            idLabel.text     = ""
            titleLabel.text  = ""
            bodyLabel.text   = ""
            
            return
        }
        
        userIdLabel.text = post.userId
        idLabel.text     = post.id
        titleLabel.text  = post.title
        bodyLabel.text   = post.body
    }
    
    func showHUD() {
        PKHUD.sharedHUD.show()
    }
    
    func dismissHUD() {
        PKHUD.sharedHUD.hide()
    }
    
    // MARK: - Helper - 
    
    private func configureHUD() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
    }
    
    private func configureUI() {
        userIdLabel.textColor = UIColor.lightGrayColor()
        idLabel.textColor = UIColor.lightGrayColor()
        titleLabel.textColor = UIColor.lightGrayColor()
        bodyLabel.textColor = UIColor.lightGrayColor()
    }
    
}
