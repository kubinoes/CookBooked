//
//  CookBookedApp.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 08/06/2023.
//

import SwiftUI

@main
struct CookBookedApp: App {
    private let mainContext = DataController.shared.mainContext
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, mainContext)
        }
    }
}
