//
//  ContentView.swift
//  SkylabExample
//
//  Created by Curtis Liu on 11/9/20.
//

import SwiftUI

import Skylab

struct ContentView: View {
    var body: some View {
        let variant = Skylab.getInstance()?.getVariant("ios-demo");
        if (variant == "on") {
            Text("Hello, world! ios-demo is \(variant ?? "(nil)")")
                .padding()
        } else {
            Text("Hello, world!").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
