//
//  DefaultValues.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public func defaultStringIfNil(_ value: String?, defaultValue: String = "") -> String {
    return defaultIfNil(value, defaultValue: defaultValue)
}

public func defaultIntIfNil(_ value: Int?, defaultValue: Int = 0) -> Int {
    return defaultIfNil(value, defaultValue: defaultValue)
}

public func defaultFloatIfNil(_ value: Float?, defaultValue: Float = 0.0) -> Float {
    return defaultIfNil(value, defaultValue: defaultValue)
}

public func defaultDateIfNil(_ value: Date?, defaultValue: Date = Date()) -> Date {
    return defaultIfNil(value, defaultValue: defaultValue)
}

public func defaultBoolIfNil(_ value: Bool?, defaultValue: Bool = false) -> Bool {
    return defaultIfNil(value, defaultValue: defaultValue)
}

public func defaultIfNil<T>(_ value: T?, defaultValue: T) -> T {
    if value == nil {
        return defaultValue
    }
    return value!
}
