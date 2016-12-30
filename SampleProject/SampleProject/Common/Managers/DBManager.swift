//
//  DBManager.swift
//  SampleProject
//
//  Created by Tri Vo on 12/30/16.
//  Copyright © 2016 Tri Vo. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    private  var realm : Realm?
    
    init() {
        do {
            try realm = Realm()
        } catch _ {
            print("Realm error")
        }
    }
    
    deinit {
        self.realm = nil
    }
    
    static let sharedInstance : DBManager = {
        DBManager()
    }();
    
    fileprivate func beginTransaction() {
        self.realm?.beginWrite()
    }
    
    fileprivate func endTransaction() {
        try! self.realm!.commitWrite()
    }
    
    fileprivate func saveObject(_ obj : Object?, update : Bool) {
        guard obj != nil else {
            return
        }
        self.realm?.add(obj!, update: update)
    }
    
    fileprivate func saveObjects(_ objs : [Object]?, update : Bool) {
        guard objs != nil else {
            return
        }
        self.realm?.add(objs!, update: update)
    }
}
