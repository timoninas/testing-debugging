import UIKit

protocol BuilderProtocol: class {
    static func buildCatalogViewController() -> UIViewController
}

final class Builder: BuilderProtocol {
    static func buildCatalogViewController() -> UIViewController {
        let view = CatalogView()
        let presenter: CatalogOutputProtocol = CatalogPresenter(view: view, products: Products)
        view.presenter = presenter
        return view
    }
}
