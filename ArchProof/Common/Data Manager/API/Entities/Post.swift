//
//  Post.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: NSObject, Mappable {
 
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    required init?(_: Map) {
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
    
}