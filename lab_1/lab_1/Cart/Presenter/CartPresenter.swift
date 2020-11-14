import Foundation

protocol CartInputProtocol: class {
    func success()
    func failure()
}

protocol CartOutputProtocol: class {
    init(view: CartInputProtocol)
    func fetchCart()
    func getCart() -> [CartProduct]
}


class CartPresenter: CartOutputProtocol {
    private var products: [CartProduct]!
    private var view: CartInputProtocol!
    
    required init(view: CartInputProtocol) {
        self.view = view
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
