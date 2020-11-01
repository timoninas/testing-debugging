import Foundation

protocol CatalogInputProtocol: class {
}

protocol CatalogOutputProtocol: class {
    init(view: CatalogInputProtocol, products: [Product]?)
    func resetProducts()
    var products: [Product]? {get set}
    var typesProducts: [String] {get set}
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
    }
}
