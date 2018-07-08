//
//  BaseViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 07/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, StoryboardLoadable {
    
    class var NAME: String { return "" }
    class var ID: String { return "" }
    
    static func storyboardName() -> String {
        return self.NAME
    }
    
    static func storyboardIdentifier() -> String {
        return self.ID
    }
}
