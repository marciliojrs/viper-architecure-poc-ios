//
//  APIRouter.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    static let baseURLString = "http://jsonplaceholder.typicode.com"
    
    case Posts
    
    var URLRequest: NSMutableURLRequest {
        let result: (method: Alamofire.Method, path: String, parameters: [String: AnyObject]?) = {
            switch self {
            case .Posts:
                return (.GET, "/posts", nil)
            }
        }()
        
        let URL = NSURL(string: APIRouter.baseURLString)!
        
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        URLRequest.HTTPMethod = result.method.rawValue
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        return encoding.encode(URLRequest, parameters: result.parameters).0
    }
    
}
