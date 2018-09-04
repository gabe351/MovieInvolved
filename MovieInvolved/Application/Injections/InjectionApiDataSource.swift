//
//  InjectionApiDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionApiDataSource {
    
    static func provieMovieApiDataSource() -> MovieApiDataSource {
        return MovieApiDataSourceImpl.getInstance()
    }    
}

