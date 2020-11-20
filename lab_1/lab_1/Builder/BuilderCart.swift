import UIKit

protocol BuilderCartProtocol: class {
    func buildCartModule(router: RouterCartProtocol) -> UIViewController
}

final class BuilderCart: BuilderCartProtocol {
    func buildCartModule(router: RouterCartProtocol) -> UIViewController {
        let view = CartView()
        let presenter = CartPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}

