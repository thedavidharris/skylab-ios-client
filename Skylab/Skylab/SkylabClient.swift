//
//  SkylabClient.swift
//  Skylab
//
//  Copyright © 2020 Amplitude. All rights reserved.
//

import Foundation

public protocol SkylabClient {
    func start(user: SkylabUser, completion: (() -> Void)?) -> Void
    func setUser(user: SkylabUser, completion: (() -> Void)?) -> Void
    func getVariant(flagKey: String, fallback: String?) -> String?
    func refetchAll(completion: (() -> Void)?) -> Void
    func setIdentityProvider(identityProvider: SkylabIdentityProvider) -> SkylabClient
}


public class SkylabClientImpl : SkylabClient {

    internal let apiKey: String
    internal let storage: SkylabStorage
    internal let config: SkylabConfig
    internal var userId: String?
    internal var user: SkylabUser?
    internal var identityProvider: SkylabIdentityProvider?

    init(apiKey: String, config: SkylabConfig) {
        self.apiKey = apiKey
        self.storage = SkylabInMemoryStorage()
        self.config = config
        self.userId = nil
        self.user = nil
        self.identityProvider = nil
    }


    public func start(user: SkylabUser, completion: (() -> Void)? = nil) -> Void {
        self.user = user
        self.fetchAll(completion: completion)
    }

    public func setUser(user: SkylabUser, completion: (() -> Void)? = nil) -> Void {
        self.user = user
        self.fetchAll(completion: completion)
    }

    public func refetchAll(completion: (() -> Void)? = nil) -> Void {
        self.fetchAll(completion:completion)
    }

    public func fetchAll(completion:  (() -> Void)? = nil) {
        let session = URLSession.shared

        let data = self.user?.toDictionary()
        do {
            let data = try JSONSerialization.data(withJSONObject: data ?? [:], options: [])
            let b64encodedUrl = data.base64EncodedString().replacingOccurrences(of: "+", with: "-")
                .replacingOccurrences(of: "/", with: "_")
                .replacingOccurrences(of: "=", with: "")

            let url = URL(string: "\(config.serverUrl)/sdk/variants/\(b64encodedUrl)")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Api-Key \(self.apiKey)", forHTTPHeaderField: "Authorization")
            let task = session.dataTask(with: request) { (data, response, error) in
                // Check the response
                if let httpResponse = response as? HTTPURLResponse {

                    // Check if an error occured
                    if (error != nil) {
                        // HERE you can manage the error
                        print("[Skylab] \(error!)")
                        completion?()
                        return
                    }

                    if (httpResponse.statusCode != 200) {
                        print("[Skylab] \(httpResponse.statusCode) received for \(url)")
                        completion?()
                        return
                    }

                    // Serialize the data into an object
                    do {
                        let flags = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: String] ?? [:]
                        self.storage.clear()
                        for (key, value) in flags {
                            let _ = self.storage.put(key: key, value: value)
                        }
                        print("[Skylab] Fetched all: \(flags)")
                    } catch {
                        print("[Skylab] Error during JSON serialization: \(error.localizedDescription)")
                    }
                }

                completion?()
            }
            task.resume()
        } catch {
            print("[Skylab] Error during JSON serialization: \(error.localizedDescription)")
        }
    }

    public func getVariant(flagKey: String, fallback: String? = nil) -> String? {
        return self.storage.get(key: flagKey) ?? fallback ?? self.config.fallbackVariant
    }

    public func setIdentityProvider(identityProvider: SkylabIdentityProvider) -> SkylabClient {
        self.identityProvider = identityProvider
        return self
    }
}
