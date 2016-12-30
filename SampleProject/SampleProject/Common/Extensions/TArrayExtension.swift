//
//  TArrayExtension.swift
//  SampleProject
//
//  Created by Tri Vo on 12/30/16.
//  Copyright © 2016 Tri Vo. All rights reserved.
//

import Foundation

extension Array {
    func contains<T>(_ obj : T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
