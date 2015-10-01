//
//  DependencyInjection.swift
//  ArchProof
//
//  Created by Marcilio Junior on 10/1/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import Swinject

struct DependencyInjection {
    
    static let sharedInstance = DependencyInjection()
    let container = Container()
    
    init() {
        commonInjections()
        listModuleInjections()
        detailModuleInjections()
    }
    
    private func commonInjections() {
        container.register(RootWireframe.self) { _ in RootWireframe() }
        container.register(APIDataManager.self) { _ in APIDataManager() }
        
        container.register(SwinjectStoryboard.self) { _ in
            SwinjectStoryboard.create(name: "Main", bundle: NSBundle.mainBundle(), container: self.container)
        }.inObjectScope(ObjectScope.Container)
    }
    
    private func listModuleInjections() {
        let storyboard = container.resolve(SwinjectStoryboard.self)
        
        container.register(PostsListVC.self) { (r) in
            let controller = storyboard!.instantiateViewControllerWithIdentifier("PostsListViewIdentifier") as! PostsListVC
            controller.presenter = r.resolve(PostsListPresenter.self)
            
            return controller
        }
        
        container.register(PostsListWireframe.self) { (r) in
            let wireframe = PostsListWireframe()
            
            wireframe.postsListViewController = r.resolve(PostsListVC.self)
            wireframe.rootWireframe = r.resolve(RootWireframe.self)
            wireframe.postDetailWireframe = r.resolve(PostDetailWireframe.self)
            
            return wireframe
        }
        
        container.register(PostsListInteractor.self) { (r) in
            let interactor = PostsListInteractor()
            
            interactor.dataManager = r.resolve(APIDataManager.self)
            
            return interactor
        }.initCompleted { (r, interactor) in
            interactor.delegate = r.resolve(PostsListPresenter.self)
        }
        
        container.register(PostsListPresenter.self) { (r) in
            let presenter = PostsListPresenter()
            
            presenter.interactor = r.resolve(PostsListInteractor.self)
            
            return presenter
        }.initCompleted { (r, presenter) in
            presenter.interface = r.resolve(PostsListVC.self)
            presenter.listWireframe = r.resolve(PostsListWireframe.self)
            presenter.detailWireframe = r.resolve(PostDetailWireframe.self)
        }
    }
    
    private func detailModuleInjections() {
        let storyboard = container.resolve(SwinjectStoryboard.self)
        
        container.register(PostDetailVC.self) { (r) in
            let controller = storyboard!.instantiateViewControllerWithIdentifier("PostDetailViewIdentifier") as! PostDetailVC
            
            return controller
        }.initCompleted { (r, controller) -> () in
            controller.presenter = r.resolve(PostDetailPresenter.self)
        }
        
        container.register(PostDetailWireframe.self) { (r) in
            let wireframe = PostDetailWireframe()
            
            wireframe.postDetailViewController = r.resolve(PostDetailVC.self)
            
            return wireframe
        }
        
        container.register(PostDetailInteractor.self) { (r) in
            let interactor = PostDetailInteractor()
            
            interactor.dataManager = r.resolve(APIDataManager.self)
            
            return interactor
        }.initCompleted { (r, interactor) in
            interactor.delegate = r.resolve(PostDetailPresenter.self)
        }
        
        container.register(PostDetailPresenter.self) { (r) in
            let presenter = PostDetailPresenter()
            
            presenter.interactor = r.resolve(PostDetailInteractor.self)
            presenter.wireframe = r.resolve(PostDetailWireframe.self)
            
            return presenter
        }.initCompleted { (r, presenter) in
            presenter.interface = r.resolve(PostDetailVC.self)
        }
    }
    
}