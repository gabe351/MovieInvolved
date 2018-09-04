//
//  InjectionUseCase.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionUseCase {
    
    static func provideGetMovies() -> GetMovies {
        let repository = InjectionRepository.provideMovieRepository()
        return GetMovies(repository: repository)
    }
}
