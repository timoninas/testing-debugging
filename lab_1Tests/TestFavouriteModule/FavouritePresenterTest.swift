import XCTest
import CoreData
@testable import lab_1

class MockFavouritePresenter: FavouriteOutputProtocol {
    required init(view: FavouriteInputProtocol, coreDataManager: FavouriteAccessProtocol, router: RouterFavouriteProtocol) {
    }
    
    public var isfetchFavourite: Bool!
    func fetchFavourite() {
        isfetchFavourite = true
    }
    
    public var products: [FavouriteProduct]!
    func getFavouriteProducts() -> [FavouriteProduct] {
        products = [FavouriteProduct(), FavouriteProduct(), FavouriteProduct()]
        return products
    }
    
    public var product: FavouriteProduct!
    func tapOnProduct(product: FavouriteProduct) {
        self.product = product
    }
}

class FavouritePresenterTest: XCTestCase {
    var view: FavouriteView!
    var presenter: MockFavouritePresenter!
    var router: RouterFavouriteProtocol!
    var coreDataManager: FavouriteAccessProtocol!

    override func setUp() {
        let navigationController = UINavigationController()
        let builder = BuilderFavourite()
        router = RouterFavourite(navigationController: navigationController, builder: builder)
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
        coreDataManager = nil
    }
    
    func testFetchFavourite() throws {
        // Arrange
        view = FavouriteView()
        coreDataManager = CoreDataManagerTst()
        presenter = MockFavouritePresenter(view: view, coreDataManager: coreDataManager, router: router)
        view.presenter = presenter
        
        // Act
        view.presenter.fetchFavourite()
        
        // Assert
        XCTAssertEqual(presenter.isfetchFavourite, true)
        XCTAssertNotNil(presenter.isfetchFavourite)
    }
    
    func testGetFavouriteProducts() throws {
        // Arrange
        view = FavouriteView()
        coreDataManager = MockCoreDataForFavourite()
        presenter = MockFavouritePresenter(view: view, coreDataManager: coreDataManager, router: router)
        view.presenter = presenter
        
        // Act
        let products = view.presenter.getFavouriteProducts()
        
        // Assert
        XCTAssertEqual(products.isEmpty, false)
        XCTAssertEqual(products, presenter.products)
    }
    
    func testTapOnProduct() throws {
        // Arrange
        view = FavouriteView()
        coreDataManager = MockCoreDataForFavourite()
        presenter = MockFavouritePresenter(view: view, coreDataManager: coreDataManager, router: router)
        view.presenter = presenter
        let product = FavouriteProduct()
        
        // Act
        view.presenter.tapOnProduct(product: product)
        
        // Assert
        XCTAssertEqual(product, presenter.product)
        XCTAssertNotNil(presenter.product)
    }
}
