//
//  APIConstants.swift
//  SampleProject
//
//  Created by Tri Vo on 12/30/16.
//  Copyright © 2016 Tri Vo. All rights reserved.
//

import Foundation

struct APIConstants {
    struct Common {
        static let SERVER_URL = "YOUR_SERVER_URL"
        
        struct HttpHeader {
            #if KP_DEV
            static let Environment = ("environment","dev")
            #elseif KP_STAGING
            static let Environment = ("environment","staging")
            #else
            static let Environment = ("environment","production")
            #endif
            
            static let ContentType = ("content-type","application/json")
        }
    }
}
