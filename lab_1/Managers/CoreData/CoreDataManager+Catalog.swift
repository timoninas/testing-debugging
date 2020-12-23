import Foundation
import CoreData

protocol CatalogAccessProtocol {
    func getCatalog() -> [CatalogProduct]
}

extension CoreDataManager: CatalogAccessProtocol {
    func getCatalog() -> [CatalogProduct] {
        let context = self.viewContext
        let fetchRequest = NSFetchRequest<CatalogProduct>(entityName: "CatalogProduct")
        var catalogProducts = [CatalogProduct]()
        
        do {
            catalogProducts = try context.fetch(fetchRequest)
            
            catalogProducts.forEach { (product) in
                print("\(product.name) \(product.type) \(product.price) \n")
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return catalogProducts
    }
    
    func addProductToCatalog(product: Product) {
        let context = self.viewContext
        let productEntity = NSEntityDescription.insertNewObject(forEntityName: "CatalogProduct",
                                                                into: context)
        productEntity.setValue(product.name, forKey: "name")
        productEntity.setValue(product.price, forKey: "price")
        productEntity.setValue(product.type, forKey: "type")
        productEntity.setValue(product.url, forKey: "url")
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteProductFromCatalog(product: CatalogProduct) {
        let context = self.viewContext
        
        context.delete(product)
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
