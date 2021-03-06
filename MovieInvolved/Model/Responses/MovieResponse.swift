//
//  MovieResponse.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class MovieResponse: NSObject, Mappable {
    
    var id: Int?
    var title: String?
    var originalTitle: String?
    var voteAverage: Float?
    var posterPath: String?
    var releaseDate: String?
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id            <- map[APIField.id]
        title         <- map[APIField.title]
        originalTitle <- map[APIField.originalTitle]
        voteAverage   <- map[APIField.voteAverage]
        posterPath    <- map[APIField.posterPath]
        releaseDate   <- map[APIField.releaseDate]
    }
    
    private struct APIField {
        
        static let id            = "id"
        static let title         = "title"
        static let originalTitle = "original_title"
        static let voteAverage   = "vote_average"
        static let posterPath    = "poster_path"
        static let releaseDate   = "release_date"
    }
}
