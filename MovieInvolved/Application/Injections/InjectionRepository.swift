//
//  InjectionRepository.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionRepository {
    
    static func provideMovieRepository() -> MovieRepository {
        let localDataSoure   = InjectionLocalDataSource.provideMovieLocalDataSource()
        let remoteDataSource = InjectionRemoteDataSource.provideMovieRemoteDataSource()
        return MovieRepositoryImpl.getInstance(localDataSource: localDataSoure,
                                               remoteDataSource: remoteDataSource)
    }
}
