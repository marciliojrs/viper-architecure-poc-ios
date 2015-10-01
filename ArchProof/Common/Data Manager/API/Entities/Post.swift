//
//  Post.swift
//  ArchProof
//
//  Created by Marcilio Junior on 9/28/15.
//  Copyright © 2015 HE:labs. All rights reserved.
//

import Foundation
import Genome

struct Post: BasicMappable {
    private(set) var userId: Int = 0
    private(set) var id: Int = 0
    private(set) var title: String = ""
    private(set) var body: String = ""
    
    mutating func sequence(map: Map) throws {
        try userId <~ map["userId"]
        try id <~ map ["id"]
        try title <~ map["title"]
        try body <~ map["body"]
    }
}