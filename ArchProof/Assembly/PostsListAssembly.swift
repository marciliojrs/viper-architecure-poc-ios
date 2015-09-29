//
//  PostsListAssembly.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Typhoon

class PostsListAssembly: TyphoonAssembly {

    var applicationAssembly: ApplicationAssembly!
    var postDetailAssembly: PostDetailAssembly!
    
    dynamic func postsListWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(PostsListWireframe.self) {
            (definition) in
            
            definition.injectProperty("rootWireframe", with: self.applicationAssembly.rootWireframe())
            definition.injectProperty("postsListViewController", with: self.postsListViewController())
            definition.injectProperty("postDetailWireframe", with: self.postDetailAssembly.postDetailWireframe())
            
        }
    }
    
    dynamic func postsListInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PostsListInteractor.self) {
            (definition) in
            
            definition.injectProperty("dataManager", with: self.applicationAssembly.apiDataManager())
            definition.injectProperty("delegate", with: self.postsListPresenter())
            
        }
    }
    
    dynamic func postsListPresenter() -> AnyObject {
        return TyphoonDefinition.withClass(PostsListPresenter.self) {
            (definition) in
            
            definition.injectProperty("interface", with: self.postsListViewController())            
            definition.injectProperty("interactor", with: self.postsListInteractor())
            definition.injectProperty("listWireframe", with: self.postsListWireframe())
            
        }
    }
    
    dynamic func postsListViewController() -> AnyObject {

        return TyphoonDefinition.withFactory(self.applicationAssembly.mainStoryboard(), selector: "instantiateViewControllerWithIdentifier:", parameters: { (factoryMethod) in
            
            factoryMethod.injectParameterWith("PostsListViewIdentifier")
            
        }) { (definition) -> Void in
            
            definition.injectProperty("presenter", with: self.postsListPresenter())
            
        }
        
    }
    
}
