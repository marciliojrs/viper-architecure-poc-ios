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

enum APIResult<T> {
    case Success(T)
    case Failure(ErrorType)
}

struct APIDataManager: DataManagerInterface {

    func fetchPosts(completion: APIResult<[Post]> -> Void) {
        Alamofire.request(APIRouter.Posts(postId: nil)).responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                do {
                    let json = try self.toJsonArray(value)
                    let posts = try [Post].mappedInstance(json)
                    
                    completion(.Success(posts))
                }
                catch {
                    completion(.Failure(error))
                }
            case .Failure(let error):
                completion(.Failure(error))
            }
        }
    }
    
    func fetchPostWithId(postId: Int, completion: APIResult<Post> -> Void) {
        Alamofire.request(APIRouter.Posts(postId: postId)).responseJSON { (response) in
            switch response.result {
            case .Success(let value):
                do {
                    let json = try self.toJson(value)
                    let post = try Post.mappedInstance(json)
                    
                    completion(.Success(post))
                }
                catch {
                    completion(.Failure(error))
                }
            case .Failure(let error):
                completion(.Failure(error))
            }
        }
    }
    
    // MARK: - Helper -
    
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
