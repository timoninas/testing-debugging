import XCTest
import CoreData
@testable import lab_1

class RouterFavouriteTest: XCTestCase {
    var router: RouterFavourite!
    var builder = BuilderFavourite()
    var navigationController = MockNavigationController()
    
    override func setUp() {
        router = RouterFavourite(navigationController: navigationController, builder: builder)
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
