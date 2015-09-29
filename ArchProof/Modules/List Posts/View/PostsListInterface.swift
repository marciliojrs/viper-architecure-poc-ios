//
//  PostsListInterface.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/29/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation

@objc protocol PostsListInterface {
    
    func setTableViewData(data: [PostsListViewModel])
    
    func reloadData()
    
    func showHUD()
    
    func dismissHUD()
    
}