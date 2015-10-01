//
//  APIDataManager.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import Alamofire
import Genome

enum APIError : ErrorType {
    case UnableToConvertJson
}

struct APIDataManager: DataManagerInterface {

    func fetchPosts(completion: ([Post] -> Void)) {
        Alamofire.request(APIRouter.Posts(postId: nil)).responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                do {
                    let json = try self.toJsonArray(value)
                    let posts = try [Post].mappedInstance(json)
                    completion(posts)
//                    completion(.Success(photo))
                }
                catch {
//                    completion(.Failure(error))
                }
            case .Failure(let error):
                print(error)
//                completion(.Failure(error))
            }
        }
//        Alamofire.request(APIRouter.Posts(postId: nil)).responseArray { (posts: [Post]?, error: ErrorType?) in
//            completion(posts!)
//        }
    }
    
    func fetchPostWithId(postId: Int, completion: (Post -> Void)) {
        Alamofire.request(APIRouter.Posts(postId: postId)).responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                do {
                    let json = try self.toJson(value)
                    let post = try Post.mappedInstance(json)
                    completion(post)
//                    completion(.Success(photo))
                }
                catch {
//                    completion(.Failure(error))
                }
            case .Failure(let error):
                print(error)
//                completion(.Failure(error))
            }
        }
    }
    
    private func toJson(value: AnyObject) throws -> JSON {
        if let json = value as? JSON {
            return json
        }
        else {
            throw APIError.UnableToConvertJson
        }
    }
    
    private func toJsonArray(value: AnyObject) throws -> [JSON] {
        if let json = value as? [JSON] {
            return json
        }
        else {
            throw APIError.UnableToConvertJson
        }
    }
    
}
