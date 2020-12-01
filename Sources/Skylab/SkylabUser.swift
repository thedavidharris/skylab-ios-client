//
//  SkylabUser.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public struct SkylabUser {
    public let id: String?
    public let deviceId: String?
    public let userId: String?
    public let version: String?
    public let country: String?
    public let city: String?
    public let region: String?
    public let language: String?
    public let platform: String?
    public let userProperties: [String: String]?

    public init(
        id: String? = nil,
        deviceId: String? = nil,
        userId: String? = nil,
        version: String? = nil,
        country: String? = nil,
        city: String? = nil,
        region: String? = nil,
        language: String? = nil,
        platform: String? = nil,
        userProperties: [String: String]? = nil
    ) {
        self.id = id
        self.deviceId = deviceId
        self.userId = userId
        self.version = version
        self.country = country
        self.city = city
        self.region = region
        self.language = language
        self.platform = platform
        self.userProperties = userProperties
    }

    public func toDictionary() -> [String:Any] {
        var data = [String:Any]()
        data["id"] = self.id
        data["device_id"] = self.deviceId
        data["user_id"] = self.userId
        data["version"] = self.version
        data["country"] = self.country
        data["city"] = self.city
        data["region"] = self.region
        data["language"] = self.language
        data["platform"] = self.platform
        data["user_properties"] = self.userProperties
        return data
    }
}
