//
//  WSMVVMLightSwiftExampleApp.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 08/08/23.
//

import SwiftUI
import MVVMLightSwift

@main
struct WSMVVMLightSwiftExampleApp: App {
    
    var sessionManager: SessionManager = InstanceLocator<SessionManager>.instance
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }.environmentObject(sessionManager)
        }
    }
}
