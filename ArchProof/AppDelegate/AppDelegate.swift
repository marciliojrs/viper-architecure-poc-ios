//
//  AppDelegate.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var postsListWireframe: PostsListWireframe?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {        
        postsListWireframe = DependencyInjection.sharedInstance.container.resolve(PostsListWireframe.self)
        postsListWireframe?.presentListInterfaceFromWindow(window!)
        
        return true
    }

}

