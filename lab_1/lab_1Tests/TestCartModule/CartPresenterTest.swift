import XCTest
import CoreData
@testable import lab_1

class MockCartPresenter: CartOutputProtocol {
    public var isInitialized: Bool?
    required init(view: CartInputProtocol, coreDataManager: CartAccessProtocol, router: RouterCartProtocol) {
        isInitialized = true
    }
    
    public var isFetchCart: Bool?
    func fetchCart() {
        isFetchCart = true
    }
    
    public var products: [CartProduct]!
    func getCart() -> [CartProduct] {
        products = [CartProduct(), CartProduct(), CartProduct()]
        return products
    }
    
    public var product: CartProduct!
    func tapOnProduct(product: CartProduct) {
        self.product = product
    }
}

class CartPresenterTest: XCTestCase {
    var view: CartView!
    var coreDataManager: MockCoreDataForCart!
    var router: RouterCartProtocol!
    var presenter: MockCartPresenter!
    
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
    
    func testInit() throws {
        // Arrange
        view = CartView()
        
        // Act
        presenter = MockCartPresenter(view: view, coreDataManager: coreDataManager, router: router)
        
        // Assert
        XCTAssertNotNil(presenter.isInitialized)
        XCTAssertEqual(presenter.isInitialized, true)
        
    }
    
    func testFetchCart() throws {
        // Arrange
        view = CartView()
        presenter = MockCartPresenter(view: view, coreDataManager: coreDataManager, router: router)
        view.presenter = presenter
        
        // Act
        view.presenter.fetchCart()
        
        // Assert
        XCTAssertNotNil(presenter.isFetchCart)
        XCTAssertEqual(presenter.isFetchCart, true)
        
    }
    
    func testGetCart() throws {
        // Arrange
        view = CartView()
        presenter = MockCartPresenter(view: view, coreDataManager: coreDataManager, router: router)
        view.presenter = presenter
        
        // Act
        let products = view.presenter.getCart()
        
        // Assert
        XCTAssertNotNil(presenter.products)
        XCTAssertEqual(products, presenter.products)
    }
    
    func testTapOnProduct() throws {
        // Arrange
        view = CartView()
        presenter = MockCartPresenter(view: view, coreDataManager: coreDataManager, router: router)
        view.presenter = presenter
        let product = CartProduct()
        
        // Act
        view.presenter.tapOnProduct(product: product)
        
        // Assert
        XCTAssertNotNil(presenter.product)
        XCTAssertEqual(product, presenter.product)
    }
}
