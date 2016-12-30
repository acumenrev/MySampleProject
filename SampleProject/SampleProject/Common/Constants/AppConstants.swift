//
//  AppConstants.swift
//  SampleProject
//
//  Created by Tri Vo on 12/30/16.
//  Copyright © 2016 Tri Vo. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
    
}


// MARK: - Notifications
extension AppConstants {
    struct Notifications {
        static let CanReachInternet = "canReachInternet"
    }
}

// MARK: - Colors
extension AppConstants {
    struct Colors {
        static func color(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
            return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
        }
        
        static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha : CGFloat) -> UIColor{
            return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha/225.0)
        }
        
        static let kpRed = Colors.color(red: 251, green: 1, blue: 100)
        static let kpBlue = Colors.color(red: 71, green: 159, blue: 228, alpha: 255.0)
        
    }
}


// MARK: - UserDefaults
extension AppConstants {
    struct UserDefaults {
        static let udid = "udid"
    }
}


// MARK: - Fonts
extension AppConstants {
    struct Fonts {
        static let FONT_SIZE_SMALL : CGFloat = 14
        static let FONT_SIZE_NORMAL : CGFloat = 16
        static let FONT_SIZE_BIG : CGFloat = 17
        
        enum FontStyle : String {
            case FONT_LEOW_LIGHT = "Loew-Light"
            case FONT_LEOW_MEDIUM = "Loew-Medium"
            case FONT_LEOW_REGULAR = "Loew-Regular"
            case FONT_LEOW_ITALIC = "Loew-Italic"
            case FONT_LEOW_LIGHT_ITALIC = "Loew-LightItalic"
            case FONT_LEOW_MEDIUM_ITALIC = "Loew-MediumItalic"
            case FONT_LEOW_BLACK = "Loew-Black"
            case FONT_LEOW_BOLD = "Loew-Bold"
            case FONT_LEOW_EXTRA_BOLD = "Loew-ExtraBold"
            case FONT_LEOW_HEAVY = "Loew-Heavy"
            case FONT_LEOW_BLACK_ITALIC = "Loew-BlackItalic"
            case FONT_LEOW_BOLD_ITALIC = "Loew-BoldItalic"
            case FONT_LEOW_EXTRA_BOLD_ITALIC = "Loew-ExtraBoldItalic"
            case FONT_LEOW_HEAVY_ITALIC = "Loew-HeavyItalic"
            case FONT_LEOW_THIN = "Loew-Thin"
            case FONT_LEOW_THIN_ITALIC = "Loew-ThinItalic"
            case FONT_GEOMETOS = "Geometos"
        }
        
        
        
        static func font(Style fontStyle : FontStyle, size : CGFloat) -> UIFont {
            return UIFont(name: fontStyle.rawValue, size: size)!
        }
        
    }
}
