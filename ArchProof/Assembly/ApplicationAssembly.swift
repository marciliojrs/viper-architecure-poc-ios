//
//  ApplicationAssembly.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import Typhoon

class ApplicationAssembly: TyphoonAssembly {

    var postsListAssembly: PostsListAssembly!
    
    dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) { definition in
            
            definition.injectProperty("postsListWireframe", with: self.postsListAssembly.postsListWireframe())
            
        }
    }
    
    dynamic func rootWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(RootWireframe.self)
    }
    
    dynamic func mainStoryboard() -> AnyObject {
        return TyphoonDefinition.withClass(TyphoonStoryboard.self) {
            (definition) in
            
            definition.useInitializer("storyboardWithName:factory:bundle:") {
                (initializer) in
                
                initializer.injectParameterWith("Main")
                initializer.injectParameterWith(self)
                initializer.injectParameterWith(NSBundle.mainBundle())
                
            }
            
            definition.scope = TyphoonScope.Singleton
            
        }
    }
    
}
