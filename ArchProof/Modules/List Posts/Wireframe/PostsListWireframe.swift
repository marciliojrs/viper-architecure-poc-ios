//
//  ListPostsWireframe.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import UIKit

class PostsListWireframe: NSObject {

    var rootWireframe: RootWireframe?
    var postsListViewController: PostsListVC?
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        rootWireframe?.showRootViewController(postsListViewController!, inWindow: window)
    }
    
}
