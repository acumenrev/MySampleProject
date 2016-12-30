//
//  TDictionaryExtension.swift
//  SampleProject
//
//  Created by Tri Vo on 12/30/16.
//  Copyright © 2016 Tri Vo. All rights reserved.
//

import Foundation

extension Dictionary {
    func toJSONString() -> String? {
        let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        let jsonText = String(data: data!, encoding: String.Encoding.utf8)
        return jsonText
    }
}
