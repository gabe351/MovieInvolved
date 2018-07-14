//
//  MovieRepositoryImpl.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    
    private static var INSTANCE: MovieRepositoryImpl?
    
    private let localDataSource: MovieLocalDataSource
    private let remoteDataSource: MovieRemoteDataSource
    
    private init(localDataSource: MovieLocalDataSource,
                 remoteDataSource: MovieRemoteDataSource) {
        self.localDataSource  = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    public static func getInstance(localDataSource: MovieLocalDataSource,
                                   remoteDataSource: MovieRemoteDataSource) -> MovieRepositoryImpl {
        
        if INSTANCE == nil {
            INSTANCE = MovieRepositoryImpl(localDataSource: localDataSource,
                                           remoteDataSource: remoteDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance(){
        INSTANCE = nil
    }
    
        
    
    
    
}
