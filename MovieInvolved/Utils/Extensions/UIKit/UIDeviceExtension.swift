//
//  UIDeviceExtension.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    public static let IPHONE_5S_ID      = "iPhone 5s"
    public static let IPHONE_6_ID       = "iPhone 6"
    public static let IPHONE_6s_ID      = "iPhone 6s"
    public static let IPHONE_6_PLUS_ID  = "iPhone 6 Plus"
    public static let IPHONE_6s_PLUS_ID = "iPhone 6s Plus"
    public static let IPHONE_7_ID       = "iPhone 7"
    public static let IPHONE_7_PLUS_ID  = "iPhone 7 Plus"
    public static let IPHONE_SE_ID      = "iPhone SE"
    public static let IPHONE_8_ID       = "iPhone 8"
    public static let IPHONE_8_PLUS_ID  = "iPhone 8 Plus"
    public static let IPHONE_X_ID       = "iPhone X"
    public static let SIMULATOR_ID      = "Simulator"
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
            
        case "iPhone6,1", "iPhone6,2":                  return UIDevice.IPHONE_5S_ID
        case "iPhone7,2":                               return UIDevice.IPHONE_6_ID
        case "iPhone7,1":                               return UIDevice.IPHONE_6_PLUS_ID
        case "iPhone8,1":                               return UIDevice.IPHONE_6s_ID
        case "iPhone8,2":                               return UIDevice.IPHONE_6s_PLUS_ID
        case "iPhone9,1", "iPhone9,3":                  return UIDevice.IPHONE_7_ID
        case "iPhone9,2", "iPhone9,4":                  return UIDevice.IPHONE_7_PLUS_ID
        case "iPhone8,4":                               return UIDevice.IPHONE_SE_ID
        case "iPhone10,1", "iPhone10,4":                return UIDevice.IPHONE_8_ID
        case "iPhone10,2", "iPhone10,5":                return UIDevice.IPHONE_8_PLUS_ID
        case "iPhone10,3", "iPhone10,6":                return UIDevice.IPHONE_X_ID
        case "i386", "x86_64":                          return UIDevice.SIMULATOR_ID
        default:                                        return identifier
        }
    }
}
