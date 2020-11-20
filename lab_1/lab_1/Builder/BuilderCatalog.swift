import UIKit

protocol BuilderCatalogProtocol: class {
    func buildCatalogModule(router: RouterCatalogProtocol) -> UIViewController
}

final class BuilderCatalog: BuilderCatalogProtocol {
    func buildCatalogModule(router: RouterCatalogProtocol) -> UIViewController {
        let view = CatalogView()
        let networkService = NetworkService()
        let presenter = CatalogPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
}
