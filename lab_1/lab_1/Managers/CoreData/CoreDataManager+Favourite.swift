import Foundation
import CoreData

extension CoreDataManager {
    func getFavourite() -> [FavouriteProduct] {
        let context = self.viewContext
        let fetchRequest = NSFetchRequest<FavouriteProduct>(entityName: "FavouriteProduct")
        var favouriteProducts = [FavouriteProduct]()
        
        do {
            favouriteProducts = try context.fetch(fetchRequest)
            
            favouriteProducts.forEach { (product) in
                print("\(product.name) \(product.type) \(product.price) \n")
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return favouriteProducts
    }
    
    func addProductToFavourite(product: Product) {
        let context = self.viewContext
        let productEntity = NSEntityDescription.insertNewObject(forEntityName: "FavouriteProduct",
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
    
    func deleteProductFromFavourite(product: FavouriteProduct) {
        let context = self.viewContext
        
        context.delete(product)
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
