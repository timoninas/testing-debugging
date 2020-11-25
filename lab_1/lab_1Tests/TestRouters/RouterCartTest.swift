import XCTest
import CoreData
@testable import lab_1

class RouterCartTest: XCTestCase {
    var router: RouterCart!
    var builder = BuilderCart()
    var navigationController = MockNavigationController()
    
    override func setUp() {
        router = RouterCart(navigationController: navigationController, builder: builder)
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
