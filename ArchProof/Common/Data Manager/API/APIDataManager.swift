//
//  APIDataManager.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class APIDataManager: NSObject, DataManagerInterface {

    func fetchPosts(completion: ([Post] -> Void)?) {
        Alamofire.request(APIRouter.Posts).responseArray { (posts: [Post]?, error: ErrorType?) in
            completion?(posts!)
        }
    }
    
}
