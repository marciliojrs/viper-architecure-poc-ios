//
//  PostDetailInterface.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

@objc protocol PostDetailInterface {
 
    func bindPost(post: PostDetailViewModel?)
    
    func showHUD()
    
    func dismissHUD()
    
}
