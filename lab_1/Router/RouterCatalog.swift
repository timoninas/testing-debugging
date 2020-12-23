import UIKit

// MARK:- Catalog
protocol RouterCatalogMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: BuilderCatalogProtocol? { get set }
}

protocol RouterCatalogProtocol: RouterCatalogMain {
    func initialViewController()
    func showDetailProduct(product: Product?)
    func popToRoot()
}

class RouterCatalog: RouterCatalogProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderCatalogProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderCatalogProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = builder
    }
    
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let catalogMVP = assemblyBuilder?.buildCatalogModule(router: self) else { return }
        navigationController.viewControllers = [catalogMVP]
    }
    
    func showDetailProduct(product: Product?) {
        guard let navigationController = navigationController else { return }
        guard let catalogMVP = assemblyBuilder?.buildCatalogModule(router: self) else { return }
        let detailV = DetailView()
        detailV.product = product
        navigationController.pushViewController(detailV, animated: true)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}
