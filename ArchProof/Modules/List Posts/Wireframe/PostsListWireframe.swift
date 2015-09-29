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

    // MARK: - Properties -
    
    var rootWireframe: RootWireframe?
    var postsListViewController: PostsListVC?
    
    // MARK: - Navigation Flow Control -
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        rootWireframe?.showRootViewController(postsListViewController!, inWindow: window)
    }
    
}
