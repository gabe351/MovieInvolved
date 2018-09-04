//
//  MovieEntry.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 16/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

class MovieEntry: Object {
    
    @objc dynamic var id: Int               = 0
    @objc dynamic var title: String         = ""
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var voteAverage: Float    = 0.0
    @objc dynamic var posterPath: String    = ""
    @objc dynamic var backdropPath: String  = ""
    @objc dynamic var overview: String      = ""
    @objc dynamic var genreId: Int          = 0
    @objc dynamic var genre: String         = ""
    @objc dynamic var runtime: Int          = 0
    @objc dynamic var releaseDate: String   = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }    
}
