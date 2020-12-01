//
//  AmplitudeIdentityProvider.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

import Amplitude

public class AmplitudeIdentityProvider : IdentityProvider {

    let amplitude:Amplitude;
    var initialized:Bool;

    public init(_ amplitude:Amplitude) {
        self.amplitude = amplitude
        self.initialized = false
    }

    public func getDeviceId() -> String? {
        waitForAmplitudeInitialized()
        return self.amplitude.getDeviceId()
    }

    public func getUserId() -> String? {
        waitForAmplitudeInitialized()
        return self.amplitude.userId
    }

    func waitForAmplitudeInitialized() -> Void {
        if (initialized) {
            return
        }
        let start = CFAbsoluteTimeGetCurrent()
        while (self.amplitude.getDeviceId() == nil) {
            Thread.sleep(forTimeInterval: 0.02)
        }
        initialized = true
        let end = CFAbsoluteTimeGetCurrent()
        print("[Skylab] Waited \(end - start)s for Amplitude SDK initialization");
    }
}
