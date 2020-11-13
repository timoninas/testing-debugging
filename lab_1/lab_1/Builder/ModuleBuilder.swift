import UIKit

protocol BuilderProtocol: class {
    static func buildCatalogModule() -> UIViewController
}

final class Builder: BuilderProtocol {
    static func buildCatalogModule() -> UIViewController {
        let view = CatalogView()
        let networkService = NetworkService()
        let presenter = CatalogPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func buildFavouriteModule() -> UIViewController {
        let view = FavouriteView()
        return view
    }
    
    static func buildCartModule() -> UIViewController {
        let view = CartView()
        return view
    }
}
