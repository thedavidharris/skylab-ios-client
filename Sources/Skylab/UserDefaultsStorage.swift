//
//  UserDefaultsStorage.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

class UserDefaultsStorage: Storage {
    let userDefaults = UserDefaults.standard
    let sharedPrefsKey: String;
    let sharedPrefsPrefix = "com.amplitude.flags.cached."
    var map: [String:String] = [:]

    init(apiKey: String) {
        sharedPrefsKey = sharedPrefsPrefix + apiKey
    }

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

    func getAll() -> [String:String] {
        let copy = map
        return copy
    }

    func load() {
        map = userDefaults.dictionary(forKey: self.sharedPrefsKey) as? [String:String] ?? [:]
    }

    func save() {
        userDefaults.set(map, forKey: self.sharedPrefsKey)
    }


}
