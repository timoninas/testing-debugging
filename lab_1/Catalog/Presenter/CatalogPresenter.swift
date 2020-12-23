import Foundation

protocol CatalogInputProtocol: class {
    func success()
    func failure()
}

protocol CatalogOutputProtocol: class {
    init(view: CatalogInputProtocol, networkService: NetworkServiceProtocol, router: RouterCatalogProtocol)
    func resetProducts()
    func fetchProducts()
    var typesProducts: [String] { get }
    func filterByType(indexType: Int)
    func sortBy(type: TypeSort)
    func getProducts() -> [CatalogProduct]?
    func tapOnProduct(product: CatalogProduct)
}

enum TypeSort {
    case HighToLow
    case LowToHigh
    case TypeProduct
}

class CatalogPresenter: CatalogOutputProtocol {
    let view: CatalogInputProtocol
    let router: RouterCatalogProtocol?
    var initialProducts: [CatalogProduct]?
    var products: [CatalogProduct]?
    var networkService: NetworkServiceProtocol!
    var _typesProducts: [String] = ["Filter", "All", "Clothes", "Shoes", "Accessories"]
    
    lazy var typesProducts: [String] = {
        return _typesProducts
    }()
    
    required init(view: CatalogInputProtocol, networkService: NetworkServiceProtocol, router: RouterCatalogProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
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
    
    func getProducts() -> [CatalogProduct]? {
        return products
    }
    
    func resetProducts() {
        products = initialProducts
        view.success()
    }
    
    func tapOnProduct(product: CatalogProduct) {
        router?.showDetailProduct(product: coreDataProductToProduct(product: product))
    }
    
    func filterByType(indexType index: Int) {
        products = products?.filter({ (product) -> Bool in
            if (product.type == typesProducts[index].lowercased()) { return true }
            return false
        })
        view.success()
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
        view.success()
    }
}
