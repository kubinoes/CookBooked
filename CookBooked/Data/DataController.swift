//
//  DataController.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 08/06/2023.
//

import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    
    private init() {}
    
    private lazy var container: NSPersistentContainer  = {
        let container = NSPersistentContainer(name: "CookBooked")
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolvable error: \(error)")
            }
            // ensure that in case we try to save several recipes with the same id we will merge into one
            self.mainContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
        
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func backgroundContext() -> NSManagedObjectContext {
        return container.newBackgroundContext()
    }
}
