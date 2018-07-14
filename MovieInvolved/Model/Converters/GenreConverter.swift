//
//  GenreConverter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GenreConverter {
    
    
    public static func responseToEntity(response: GenreResponse) -> Genre {
        return Genre(id: defaultIntIfNil(response.id),
                     name: defaultStringIfNil(response.name))
    }
    
    public static func responsesToEntities(responses: [GenreResponse]) -> [Genre] {
        var genres = [Genre]()
        
        responses.forEach {
            let entity = responseToEntity(response: $0)
            genres.append(entity)
        }
        
        return genres
    }    
}
