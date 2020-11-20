import Foundation

protocol FavouriteInputProtocol: class {
    func success()
    func failure()
}

protocol FavouriteOutputProtocol: class {
    init(view: FavouriteInputProtocol, router: RouterFavouriteProtocol)
    func fetchFavourite()
    func getFavourite() -> [FavouriteProduct]
}


class FavouritePresenter: FavouriteOutputProtocol {
    private let view: FavouriteInputProtocol!
    private let router: RouterFavouriteProtocol?
    private var favouriteProducts: [FavouriteProduct]!
    
    required init(view: FavouriteInputProtocol, router: RouterFavouriteProtocol) {
        self.view = view
        self.router = router
        favouriteProducts = [FavouriteProduct]()
    }
    
    func fetchFavourite() {
        favouriteProducts = CoreDataManager.shared.getFavourite()
        if (!favouriteProducts.isEmpty) {
            view.success()
        } else {
            view.failure()
        }
    }
    
    func getFavourite() -> [FavouriteProduct] {
        return favouriteProducts
    }
}
