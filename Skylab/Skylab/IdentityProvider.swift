//
//  IdentityProvider.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public protocol IdentityProvider {
    func getDeviceId() -> String
    func getUserId() -> String
}
