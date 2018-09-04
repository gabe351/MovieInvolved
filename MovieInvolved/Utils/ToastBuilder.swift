//
//  ToastBuilder.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Toast_Swift

public class ToastBuilder {
    
    private let message: String
    private let view: UIView        
    private var color = UIColor(red:0.96, green:0.33, blue:0.20, alpha:1.0)
    private var block: (Bool) -> Void = { _ in }
    private var durationInSeconds = 1.5
    private var position: ToastPosition = .bottom
    
    var style = ToastStyle()
    
    init(message: String, view: UIView) {
        self.message = message
        self.view    = view
    }
    
    public func with(durationInSeconds: TimeInterval) -> ToastBuilder {
        self.durationInSeconds = durationInSeconds
        
        return self
    }
    
    public func with(color: UIColor) -> ToastBuilder {
        self.color = color
        
        return self
    }
    
    public func with(position: ToastPosition) -> ToastBuilder {
        self.position = position
        
        return self
    }
    
    public func with(block: @escaping (Bool) -> Void) -> ToastBuilder {
        self.block = block
        
        return self
    }
    
    public func show() {
        
        style.messageColor         = color
        style.backgroundColor      = UIColor.white
        
        let spacingPaddingLeft = "    "
        view.makeToast("\(message)\(spacingPaddingLeft)",
            duration: durationInSeconds,
            position: position,
            title: "Titile",
            style: style,
            completion: block)
        
        
    }
}

