//
//  DataController.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 08/06/2023.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CookBooked")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
            
        }
    }
}
