//
//  Variant.swift
//  Skylab
//
//  Created by Curtis Liu on 1/20/21.
//

import Foundation

public struct Variant: Codable {
    public let key: String
    public let payload: Any?

    enum CodingKeys: String, CodingKey {
        case key
        case payload
    }

    public init(_ key: String, payload: Any? = nil) {
        self.key = key
        self.payload = payload
    }

    init?(json: [String: Any]) {
        guard let key = json["key"] as? String else {
            return nil;
        }

        self.key = key
        self.payload = json["payload"]
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try values.decode(String.self, forKey: .key)
        let data = try values.decode(Data.self, forKey: .payload)
        let payload = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
        self.payload = payload["payload"]
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        var data: Data? = nil;
        if (payload != nil) {
            let v:[String:Any] = ["payload": payload!]
            data = try JSONSerialization.data(withJSONObject: v, options: [])
        }
        try container.encode(data, forKey: .payload)
    }
}
