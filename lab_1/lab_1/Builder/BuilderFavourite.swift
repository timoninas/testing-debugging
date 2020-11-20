import UIKit

protocol BuilderFavouriteProtocol: class {
    func buildFavouriteModule(router: RouterFavouriteProtocol) -> UIViewController
}

final class BuilderFavourite: BuilderFavouriteProtocol {
    func buildFavouriteModule(router: RouterFavouriteProtocol) -> UIViewController {
        let view = FavouriteView()
        let presenter: FavouriteOutputProtocol = FavouritePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
