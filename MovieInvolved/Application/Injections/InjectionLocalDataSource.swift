//
//  InjectionLocalDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

class InjectionLocalDataSource {
    static let realm = try! Realm()
    
    static func provideMovieLocalDataSource() -> MovieLocalDataSource {
        return MovieLocalDataSourceImpl.getInstance(realm: realm)
    }    
}
