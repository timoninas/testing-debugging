import UIKit
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "lab_1")
        container.loadPersistentStores { (description, error) in
            if let err = error {
                fatalError("Loading data bases failed: \(err)")
            }
        }
        return container
    }()
    
    internal var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
