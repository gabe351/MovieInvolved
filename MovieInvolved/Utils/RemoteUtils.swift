//
//  RemoteUtils.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//


import Foundation

class RemoteUtils {
    
    private static let BASE_URL = "https://api.themoviedb.org/3/"
    
    static func buildUrl(path: String) -> String {
        return "\(BASE_URL)\(path)"
    }
        
}
