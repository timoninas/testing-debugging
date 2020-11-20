import UIKit

// MARK:- Favourite
protocol RouterFavouriteMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: BuilderFavouriteProtocol? { get set }
}

protocol RouterFavouriteProtocol: RouterFavouriteMain {
    func initialViewController()
    func showDetailProduct()
    func popToRoot()
}

class RouterFavourite: RouterFavouriteProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderFavouriteProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderFavouriteProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = builder
    }
    
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let favouriteMVP = assemblyBuilder?.buildFavouriteModule(router: self) else { return }
        navigationController.viewControllers = [favouriteMVP]
    }
    
    func showDetailProduct() {
        guard let navigationController = navigationController else { return }
        guard let favouriteMVP = assemblyBuilder?.buildFavouriteModule(router: self) else { return }
        fatalError("Not implemented")
        // navigationController.pushViewController(UIViewController, animated: Bool)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}
