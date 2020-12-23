import UIKit
import CoreData

protocol CartAccessProtocol {
    func getCart() -> [CartProduct]
}

extension CoreDataManager: CartAccessProtocol {
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
