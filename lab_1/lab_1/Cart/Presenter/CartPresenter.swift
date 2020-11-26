import Foundation

protocol CartInputProtocol: class {
    func success()
    func failure()
}

protocol CartOutputProtocol: class {
    init(view: CartInputProtocol, coreDataManager: CartAccessProtocol, router: RouterCartProtocol)
    func fetchCart()
    func getCart() -> [CartProduct]
    func tapOnProduct(product: CartProduct)
}

class CartPresenter: CartOutputProtocol {
    private var products: [CartProduct]!
    private var view: CartInputProtocol!
    private let router: RouterCartProtocol?
    private let coreDataManager: CartAccessProtocol!
    
    required init(view: CartInputProtocol, coreDataManager: CartAccessProtocol, router: RouterCartProtocol) {
        self.view = view
        self.router = router
        self.products = [CartProduct]()
        self.coreDataManager = coreDataManager
    }
    
    func fetchCart() {
        let response = coreDataManager.getCart()
        if !response.isEmpty {
            self.products = response
            view.success()
        } else {
            self.products = response
            view.failure()
        }
    }
    
    func getCart() -> [CartProduct] {
        return products
    }
    
    func tapOnProduct(product: CartProduct) {
        router?.showDetailProduct(product: coreDataProductToProduct(product: product))
    }
}
