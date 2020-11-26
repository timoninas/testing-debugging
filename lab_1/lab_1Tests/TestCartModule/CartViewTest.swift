import XCTest
import CoreData
@testable import lab_1

class MockCartView: CartInputProtocol {
    public var isSuccess: Bool?
    
    func success() {
        isSuccess = true
    }
    
    func failure() {
        isSuccess = false
    }
}

class MockCoreDataForCart: CartAccessProtocol {
    public var isNeedSuccess: Bool = true
    
    func getCart() -> [CartProduct] {
        if isNeedSuccess == true {
            return [CartProduct()]
        } else {
            return [CartProduct]()
        }
    }
}

class CartViewTest: XCTestCase {
    var view: MockCartView!
    var coreDataManager: MockCoreDataForCart!
    var router: RouterCartProtocol!
    var presenter: CartOutputProtocol!
    
    override func setUp() {
        let navigationController = MockNavigationController()
        let builder = BuilderCart()
        router = RouterCart(navigationController: navigationController, builder: builder)
        coreDataManager = MockCoreDataForCart()
    }
    
    override func tearDown() {
        view = nil
        coreDataManager = nil
        router = nil
        presenter = nil
    }
    
    func testGetSuccess() throws {
        // Arrange
        view = MockCartView()
        presenter = CartPresenter(view: view, coreDataManager: coreDataManager, router: router)
        
        // Act
        presenter.fetchCart()
        
        // Assert
        XCTAssertNotNil(view.isSuccess)
        XCTAssertEqual(view.isSuccess, true)
    }
    
    func testGetFailure() throws {
        // Arrange
        view = MockCartView()
        presenter = CartPresenter(view: view, coreDataManager: coreDataManager, router: router)
        
        // Act
        coreDataManager.isNeedSuccess = false
        presenter.fetchCart()
        
        // Assert
        XCTAssertNotNil(view.isSuccess)
        XCTAssertEqual(view.isSuccess, false)
    }
}
