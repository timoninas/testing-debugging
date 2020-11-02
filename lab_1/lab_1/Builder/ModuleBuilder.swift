import UIKit

protocol BuilderProtocol: class {
    static func buildCatalogModule() -> UIViewController
}

final class Builder: BuilderProtocol {
    static func buildCatalogModule() -> UIViewController {
        let view = CatalogView()
        let presenter: CatalogOutputProtocol = CatalogPresenter(view: view, products: Products)
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
