import UIKit

// MARK:- Cart
protocol RouterCardMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: BuilderCartProtocol? { get set }
}

protocol RouterCartProtocol: RouterCardMain {
    func initialViewController()
    func showDetailProduct(product: Product?)
    func popToRoot()
}

class RouterCart: RouterCartProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderCartProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderCartProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = builder
    }
    
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let cartMVP = assemblyBuilder?.buildCartModule(router: self) else { return }
        navigationController.viewControllers = [cartMVP]
    }
    
    func showDetailProduct(product: Product?) {
        guard let navigationController = navigationController else { return }
        guard let cartView = assemblyBuilder?.buildCartModule(router: self) else { return }
        fatalError("Not implemented")
        // navigationController.pushViewController(UIViewController, animated: Bool)
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
}
