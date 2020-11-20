import Foundation

protocol CartInputProtocol: class {
    func success()
    func failure()
}

protocol CartOutputProtocol: class {
    init(view: CartInputProtocol, router: RouterCartProtocol)
    func fetchCart()
    func getCart() -> [CartProduct]
}


class CartPresenter: CartOutputProtocol {
    private var products: [CartProduct]!
    private var view: CartInputProtocol!
    private let router: RouterCartProtocol?
    
    required init(view: CartInputProtocol, router: RouterCartProtocol) {
        self.view = view
        self.router = router
        self.products = [CartProduct]()
    }
    
    func fetchCart() {
        let response = CoreDataManager.shared.getCart()
        if !response.isEmpty {
            self.products = response
            view.success()
        } else {
            view.failure()
        }
    }
    
    func getCart() -> [CartProduct] {
        return products
    }
}