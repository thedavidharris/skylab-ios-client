//
//  SkylabInMemoryStorage.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

class SkylabInMemoryStorage: SkylabStorage {
    var map: [String:String] = [:]

    func put(key: String, value: String) -> String? {
        let oldValue = map[key]
        map[key] = value
        return oldValue
    }

    func get(key: String) -> String? {
        return map[key]
    }

    func clear() {
        map = [:]
    }
    
    
}
