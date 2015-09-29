//
//  PostDetailAssembly.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Typhoon

class PostDetailAssembly: TyphoonAssembly {

    var applicationAssembly: ApplicationAssembly!
    
    dynamic func postDetailWireframe() -> AnyObject {
        return TyphoonDefinition.withClass(PostDetailWireframe.self) {
            (definition) in
         
            definition.injectProperty("postDetailViewController", with: self.postDetailViewController())

        }
    }
    
    dynamic func postDetailInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(PostDetailInteractor.self) {
            (definition) in
            
            definition.injectProperty("dataManager", with: self.applicationAssembly.apiDataManager())
            definition.injectProperty("delegate", with: self.postDetailPresenter())
            
        }
    }
    
    dynamic func postDetailPresenter() -> AnyObject {
        return TyphoonDefinition.withClass(PostDetailPresenter.self) {
            (definition) in
            
            definition.injectProperty("interface", with: self.postDetailViewController())
            definition.injectProperty("interactor", with: self.postDetailInteractor())
            definition.injectProperty("wireframe", with: self.postDetailWireframe())
            
        }
    }
    
    dynamic func postDetailViewController() -> AnyObject {
        
        return TyphoonDefinition.withFactory(self.applicationAssembly.mainStoryboard(), selector: "instantiateViewControllerWithIdentifier:", parameters: { (factoryMethod) in
            
            factoryMethod.injectParameterWith("PostDetailViewIdentifier")
            
            }) { (definition) in
                
                definition.injectProperty("presenter", with: self.postDetailPresenter())
                
        }
        
    }
    
}
