import Foundation

protocol FavouriteInputProtocol: class {
    func success()
    func failure()
}

protocol FavouriteOutputProtocol: class {
    init(view: FavouriteInputProtocol, router: RouterFavouriteProtocol)
    func fetchFavourite()
    func getFavouriteProducts() -> [FavouriteProduct]
    func tapOnProduct(product: FavouriteProduct)
}


class FavouritePresenter: FavouriteOutputProtocol {
    private let view: FavouriteInputProtocol!
    private let router: RouterFavouriteProtocol?
    private var _favouriteProducts: [FavouriteProduct]!
    
    func getFavouriteProducts() -> [FavouriteProduct] {
        return _favouriteProducts
    }
    
    required init(view: FavouriteInputProtocol, router: RouterFavouriteProtocol) {
        self.view = view
        self.router = router
        _favouriteProducts = [FavouriteProduct]()
    }
    
    func fetchFavourite() {
        _favouriteProducts = CoreDataManager.shared.getFavourite()
        if (!_favouriteProducts.isEmpty) {
            view.success()
        } else {
            view.failure()
        }
    }
    
    func tapOnProduct(product: FavouriteProduct) {
        router?.showDetailProduct(product: coreDataProductToProduct(product: product))
    }
}
