//
//  SkylabStorage.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

protocol Storage {
    func put(key: String, value: String) -> String?
    func get(key: String) -> String?
    func clear()
    func getAll() -> [String:String]
    func load()
    func save()
}
