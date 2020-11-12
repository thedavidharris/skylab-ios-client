//
//  SkylabExampleApp.swift
//  SkylabExample
//
//  Created by Curtis Liu on 11/9/20.
//

import SwiftUI

import Skylab
import Amplitude


@main
struct SkylabExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let amplitude = Amplitude.instance();
        amplitude.initializeApiKey("a6dd847b9d2f03c816d4f3f8458cdc1d")
        amplitude.setUserId("test-user")

        let config = SkylabConfig()
        let client: SkylabClient = Skylab.initialize(apiKey: "client-IAxMYws9vVQESrrK88aTcToyqMxiiJoR", config: config)
        client.setIdentityProvider(AmplitudeIdentityProvider(amplitude))
        client.start(user: SkylabUser()) {
            print("Start completion handler called")
        }
        return true
    }
}
