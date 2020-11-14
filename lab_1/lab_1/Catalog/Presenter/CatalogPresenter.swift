import Foundation

protocol CatalogInputProtocol: class {
    func reloadContent()
    func success()
    func failure()
}

protocol CatalogOutputProtocol: class {
    init(view: CatalogInputProtocol, networkService: NetworkService)
    func resetProducts()
    func fetchProducts()
    var products: [CatalogProduct]? {get set}
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
    var initialProducts: [CatalogProduct]?
    var products: [CatalogProduct]?
    var networkService: NetworkService!
    var typesProducts: [String] = ["Filter", "All", "Clothes", "Shoes", "Accessories"]
    
    required init(view: CatalogInputProtocol, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    func fetchProducts() {
        networkService.fetchCatalog { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let catalogProducts):
                self.initialProducts = catalogProducts
                self.products = catalogProducts
                self.view.success()
            case .failure(let error):
                print(error.localizedDescription)
                self.view.failure()
            }
        }
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
                if (product1.type ?? "" <= product2.type ?? "") {
                    return true
                }
                return false
            })
        }
        view.reloadContent()
    }
}
