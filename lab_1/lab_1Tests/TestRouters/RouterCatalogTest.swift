import XCTest
@testable import lab_1

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterCatalogTest: XCTestCase {
    var router: RouterCatalog!
    var builder = BuilderCatalog()
    var navigationController = MockNavigationController()
    
    
    override func setUp() {
        router = RouterCatalog(navigationController: navigationController, builder: builder)
    }
    
    override func tearDown() {
        router = nil
    }
    
    func testRouter() throws {
        router.showDetailProduct(product: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertNotNil(detailViewController)
        XCTAssertTrue(detailViewController is DetailView)
    }
}
