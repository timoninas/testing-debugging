import UIKit
import CoreData
@testable import lab_1

struct CoreDataManagerTst {
    private let core = CoreDataTestStack()
    static let shared = CoreDataManagerTst()
    
    internal var viewContext: NSManagedObjectContext {
        return core.mainContext
    }
}

extension CoreDataManagerTst: CatalogAccessProtocol {
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

extension CoreDataManagerTst: FavouriteAccessProtocol {
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

extension CoreDataManagerTst: CartAccessProtocol {
    func getCart() -> [CartProduct] {
        let context = self.viewContext
        let fetchRequest = NSFetchRequest<CartProduct>(entityName: "CartProduct")
        var cartProducts = [CartProduct]()
        
        do {
            cartProducts = try context.fetch(fetchRequest)
            
            cartProducts.forEach { (product) in
                print("\(product.name) \(product.type) \(product.price) \n")
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return cartProducts
    }
    
    func addProductToCart(product: Product) {
        let context = self.viewContext
        let productEntity = NSEntityDescription.insertNewObject(forEntityName: "CartProduct",
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
    
    func deleteProductFromCart(product: CartProduct) {
        let context = self.viewContext
        
        context.delete(product)
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
