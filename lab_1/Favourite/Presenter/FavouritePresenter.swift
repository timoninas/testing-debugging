import Foundation

protocol FavouriteInputProtocol: class {
    func success()
    func failure()
}

protocol FavouriteOutputProtocol: class {
    init(view: FavouriteInputProtocol, coreDataManager: FavouriteAccessProtocol, router: RouterFavouriteProtocol)
    func fetchFavourite()
    func getFavouriteProducts() -> [FavouriteProduct]
    func tapOnProduct(product: FavouriteProduct)
}


class FavouritePresenter: FavouriteOutputProtocol {
    private let view: FavouriteInputProtocol!
    private let router: RouterFavouriteProtocol?
    private let coreDataManager: FavouriteAccessProtocol!
    internal var _favouriteProducts: [FavouriteProduct]!
    
    func getFavouriteProducts() -> [FavouriteProduct] {
        return _favouriteProducts
    }
    
    required init(view: FavouriteInputProtocol, coreDataManager: FavouriteAccessProtocol, router: RouterFavouriteProtocol) {
        self.view = view
        self.router = router
        self.coreDataManager = coreDataManager
        _favouriteProducts = [FavouriteProduct]()
    }
    
    func fetchFavourite() {
        _favouriteProducts = coreDataManager.getFavourite()
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
