import Foundation

protocol CatalogInputProtocol: class {
    func reloadContent()
}

protocol CatalogOutputProtocol: class {
    init(view: CatalogInputProtocol, products: [Product]?)
    func resetProducts()
    var products: [Product]? {get set}
    var typesProducts: [String] {get set}
    func filterByType(indexType: Int)
    func sortBy(type: TypeSort)
}

enum TypeSort {
    case HighToLow
    case LowToHigh
    case TypeProduct
}

class CatalogPresenter: CatalogOutputProtocol {
    let view: CatalogInputProtocol
    var initialProducts: [Product]?
    var products: [Product]?
    var typesProducts: [String] = ["Filter", "All", "Clothes", "Shoes", "Accessories"]
    
    required init(view: CatalogInputProtocol, products: [Product]?) {
        self.view = view
        self.initialProducts = products
        self.products = products
    }
    
    func resetProducts() {
        products = initialProducts
        view.reloadContent()
    }
    
    func filterByType(indexType index: Int) {
        products = products?.filter({ (product) -> Bool in
            if (product.type == typesProducts[index].lowercased()) { return true }
            return false
        })
        view.reloadContent()
    }
    
    func sortBy(type: TypeSort) {
        switch type {
        case .LowToHigh:
            products?.sort(by: { (product1, product2) -> Bool in
                if (product1.price < product2.price) {
                    return true
                }
                return false
            })
        case .HighToLow:
            products?.sort(by: { (product1, product2) -> Bool in
                if (product1.price > product2.price) {
                    return true
                }
                return false
            })
        case .TypeProduct:
            products?.sort(by: { (product1, product2) -> Bool in
                if (product1.type <= product2.type) {
                    return true
                }
                return false
            })
        }
        view.reloadContent()
    }
}
