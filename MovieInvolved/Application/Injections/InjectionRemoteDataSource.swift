//
//  InjectionRemoteDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionRemoteDataSource  {
    
    static func provideMovieRemoteDataSource() -> MovieRemoteDataSource {
        let apiDataSource = InjectionApiDataSource.provieMovieApiDataSource()
        return MovieRemoteDataSourceImpl.getInstance(apiDataSource: apiDataSource)
    }
}

