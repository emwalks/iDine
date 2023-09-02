//
//  iDineApp.swift
//  iDine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import SwiftUI

@main
struct iDineApp: App {
    
    // Create a state object that will live for the life of the app
    // Observe this object via the environment and update views 
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
