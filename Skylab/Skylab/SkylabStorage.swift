//
//  SkylabStorage.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

protocol SkylabStorage {
    func put(key: String, value: String) -> String?
    func get(key: String) -> String?
    func clear()
}
