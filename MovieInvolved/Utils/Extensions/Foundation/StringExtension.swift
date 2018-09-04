//
//  StringExtension.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 09/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

extension String {
    
    func trim() -> String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
