//
//  StoryboardLoadable.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
    static func storyboardName() -> String
    static func storyboardIdentifier() -> String
}
