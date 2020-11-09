//
//  SkylabExampleApp.swift
//  SkylabExample
//
//  Created by Curtis Liu on 11/9/20.
//

import SwiftUI

import Skylab


@main
struct SkylabExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct SkylabExampleApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let config = SkylabConfig()
        let client: SkylabClient = Skylab.initialize(apiKey: "client-IAxMYws9vVQESrrK88aTcToyqMxiiJoR", config: config)
        client.start(user: SkylabUser(userId: "test-user")) {
            print("Start completion handler called")
        }
        return true
    }
}
