//
//  DonDonnApp.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

@main
struct DonDonnApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
