//
//  GenreResponse.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 01/05/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class GenreResponse: NSObject, Mappable {

    var id: Int?
    var name: String?
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id   <- map[APIField.id]
        name <- map[APIField.name]
    }
    
    private struct APIField {
        
        static let id   = "id"
        static let name = "name"
    }
}

