//
//  SkylabConfig.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public struct SkylabConfig {
    public let debug: Bool
    public let debugEnrollmentRequests: Bool
    public let fallbackVariant: Variant?
    public let initialFlags: [String: Variant]
    public let instanceName: String
    public let serverUrl: String

    public init(
        debug: Bool = AMPSkylabConfigDefaults.Debug,
        debugEnrollmentRequests: Bool = AMPSkylabConfigDefaults.DebugEnrollmentRequests,
        fallbackVariant: Variant? = AMPSkylabConfigDefaults.FallbackVariant,
        initialFlags: [String: Variant] = AMPSkylabConfigDefaults.InitialFlags,
        instanceName: String = AMPSkylabConfigDefaults.InstanceName,
        serverUrl: String = AMPSkylabConfigDefaults.ServerUrl
    ) {
        self.debug = debug
        self.debugEnrollmentRequests = debugEnrollmentRequests
        self.fallbackVariant = fallbackVariant
        self.initialFlags = initialFlags
        self.instanceName = instanceName
        self.serverUrl = serverUrl
    }
}

public struct AMPSkylabConfigDefaults {
    public static let Debug: Bool = false
    public static let DebugEnrollmentRequests: Bool = false
    public static let FallbackVariant: Variant? = nil
    public static let InitialFlags: [String: Variant] = [:]
    public static let InstanceName: String = ""
    public static let ServerUrl: String = "https://api.lab.amplitude.com"
}
