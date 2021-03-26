//
//  AmplitudeContextProvider.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

import Amplitude

public class AmplitudeContextProvider : ContextProvider {

    let amplitude:Amplitude;
    var initialized:Bool;
    var version:String?;

    public init(_ amplitude:Amplitude) {
        self.amplitude = amplitude
        self.initialized = false
        self.version = nil
    }

    public func getDeviceId() -> String? {
        waitForAmplitudeInitialized()
        return self.amplitude.getDeviceId()
    }

    public func getUserId() -> String? {
        waitForAmplitudeInitialized()
        return self.amplitude.userId
    }

    func cacheVersion() -> Void {
        version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String;
    }

    public func getVersion() -> String? {
        return version
    }

    public func getLanguage() -> String? {
        Locale(identifier: "en_US").localizedString(forLanguageCode: Locale.preferredLanguages[0])
    }

    public func getPlatform() -> String? {
        return "iOS"
    }

    public func getOs() -> String? {
        let systemVersion = ProcessInfo.processInfo.operatingSystemVersion;
        let os = "ios \(systemVersion.majorVersion).\(systemVersion.minorVersion).\(systemVersion.patchVersion)."
        return os;
    }

    public func getDeviceManufacturer() -> String? {
        return "Apple";
    }

    func getModelString() -> String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }

    public func getDeviceModel() -> String? {
        return getModelString()
    }

    func waitForAmplitudeInitialized() -> Void {
        if (initialized) {
            return
        }
        let start = CFAbsoluteTimeGetCurrent()
        while (self.amplitude.getDeviceId() as String? == nil) {
            Thread.sleep(forTimeInterval: 0.02)
        }
        initialized = true
        let end = CFAbsoluteTimeGetCurrent()
        print("[Skylab] Waited \(end - start)s for Amplitude SDK initialization");
    }
}
