import Foundation
import CoreData

protocol NetworkServiceProtocol: class {
    func fetchCatalog(completion: @escaping (Result<[CatalogProduct]?, Error>) -> ())
}

class NetworkService: NetworkServiceProtocol {
    func fetchCatalog(completion: @escaping (Result<[CatalogProduct]?, Error>) -> ()) {
        let catalog = CoreDataManager.shared.getCatalog()
        if (!catalog.isEmpty) {
            completion(.success(catalog))
        } else {
            completion(.success(catalog))
        }
    }
}
