//
//  museum_appApp.swift
//  museum-app
//
//  Created by Cordova  on 26/06/23.
//

import SwiftUI

@main
struct museum_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
