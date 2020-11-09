//
//  Skylab.swift
//  Skylab
//
//  Created by Curtis Liu on 11/9/20.
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public class Skylab {
    static var instances: [String: SkylabClient] = [:]

    public static func getInstance() -> SkylabClient? {
        return getInstance(name: AMPSkylabConfigDefaults.InstanceName)
    }

    public static func getInstance(name: String) -> SkylabClient? {
        return instances[name]
    }

    public static func initialize(apiKey: String, config: SkylabConfig) -> SkylabClient {
        let instance = getInstance(name: config.instanceName)
        if (instance != nil) {
            return instance!
        }
        let newInstance: SkylabClient = SkylabClientImpl(apiKey: apiKey, config: config)
        instances[config.instanceName] = newInstance
        return newInstance
    }
}
