//
//  SkylabIdentityProvider.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public protocol SkylabIdentityProvider {
    func getDeviceId() -> String
    func getUserId() -> String
}
