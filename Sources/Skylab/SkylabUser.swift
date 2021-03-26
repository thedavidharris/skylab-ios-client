//
//  SkylabUser.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public struct SkylabUser {
    public let deviceId: String?
    public let userId: String?
    public let version: String?
    public let country: String?
    public let region: String?
    public let dma: String?
    public let city: String?
    public let language: String?
    public let platform: String?
    public let os: String?
    public let deviceFamily: String?
    public let deviceType: String?
    public let deviceManufacturer: String?
    public let deviceModel: String?
    public let carrier: String?
    public let userProperties: [String: String]?

    public init(
        deviceId: String? = nil,
        userId: String? = nil,
        version: String? = nil,
        country: String? = nil,
        region: String? = nil,
        dma: String? = nil,
        city: String? = nil,
        language: String? = nil,
        platform: String? = nil,
        os: String? = nil,
        deviceFamily: String? = nil,
        deviceType: String? = nil,
        deviceManufacturer: String? = nil,
        deviceModel: String? = nil,
        carrier: String? = nil,
        userProperties: [String: String]? = nil
    ) {
        self.deviceId = deviceId
        self.userId = userId
        self.version = version
        self.country = country
        self.region = region
        self.dma = dma
        self.city = city
        self.language = language
        self.platform = platform
        self.os = os
        self.deviceFamily = deviceFamily
        self.deviceType = deviceType
        self.deviceManufacturer = deviceManufacturer
        self.deviceModel = deviceModel
        self.carrier = carrier
        self.userProperties = userProperties
    }

    public func toDictionary() -> [String:Any] {
        var data = [String:Any]()
        data["device_id"] = self.deviceId
        data["user_id"] = self.userId
        data["version"] = self.version
        data["country"] = self.country
        data["region"] = self.region
        data["dma"] = self.dma
        data["city"] = self.city
        data["language"] = self.language
        data["platform"] = self.platform
        data["os"] = self.os
        data["device_family"] = self.deviceFamily
        data["device_type"] = self.deviceType
        data["device_manufacturer"] = self.deviceManufacturer
        data["device_model"] = self.deviceModel
        data["carrier"] = self.carrier
        data["user_properties"] = self.userProperties
        return data
    }
}
