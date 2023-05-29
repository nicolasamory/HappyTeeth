//
//  Happy_TeethApp.swift
//  Happy Teeth
//
//  Created by Nicolas Amory P.F on 23/05/23.
//

import SwiftUI

@main
struct Happy_TeethApp: App {
    var healthModel = HealthModel()
    var body: some Scene {
        WindowGroup {
            ContentView(healthModel: healthModel)
        }
    }
}
