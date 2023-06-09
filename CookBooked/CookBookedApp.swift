//
//  CookBookedApp.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 08/06/2023.
//

import SwiftUI

@main
struct CookBookedApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
