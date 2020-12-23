import UIKit
import CoreData
@testable import lab_1

struct CoreDataTestStack {
    static let shared = CoreDataManager()
    
    public let persistentContainer: NSPersistentContainer
    
    public let mainContext: NSManagedObjectContext
    public let backgroundContext: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "lab_1")
        let description = container.persistentStoreDescriptions.first
        description?.type = NSInMemoryStoreType
        container.loadPersistentStores { (description, error) in
            if let err = error {
                fatalError("Loading data bases failed: \(err)")
            }
        }
        persistentContainer = container
        
        mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainContext.automaticallyMergesChangesFromParent = true
        mainContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        
        backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        backgroundContext.parent = self.mainContext
    }
    
    internal var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
