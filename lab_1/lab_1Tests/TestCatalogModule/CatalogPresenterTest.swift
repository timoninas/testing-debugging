
import XCTest
import CoreData
@testable import lab_1

class MockCatalogPresenter: CatalogOutputProtocol {
    var view: CatalogInputProtocol!
    var networkService: NetworkServiceProtocol!
    var router: RouterCatalogProtocol!
    
    required init(view: CatalogInputProtocol, networkService: NetworkServiceProtocol, router: RouterCatalogProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.products = nil
    }
    
    public var products: [CatalogProduct]?
    
    func resetProducts() {
        fetchProducts()
    }
    
    func fetchProducts() {
        products = [CatalogProduct(), CatalogProduct(), CatalogProduct()]
    }
    
    var typesProducts: [String] {
        return ["dummy1", "dummy2", "dummy3"]
    }
    
    public var indexType: Int?
    
    func filterByType(indexType: Int) {
        self.products = [CatalogProduct]()
        self.indexType = indexType
    }
    
    public var typeSort: TypeSort?
    
    func sortBy(type: TypeSort) {
        self.products = [CatalogProduct]()
        self.typeSort = type
    }
    
    func getProducts() -> [CatalogProduct]? {
        return products
    }
    
    public var typedProduct: CatalogProduct?
    
    func tapOnProduct(product: CatalogProduct) {
        self.typedProduct = product
    }
}

class CatalogPresenterTest: XCTestCase {
    var view: CatalogInputProtocol!
    var presenter: MockCatalogPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterCatalogProtocol!
    var product: Product!
    
    override func setUp() {
        let navigationController = UINavigationController()
        let builder = BuilderCatalog()
        router = RouterCatalog(navigationController: navigationController, builder: builder)
        networkService = NetworkService()
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testSortFilter() throws {
        // Arrange
        let view = CatalogView()
        presenter = MockCatalogPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        let indexType = 9999
        let type = TypeSort.HighToLow
        
        // Act
        view.presenter.filterByType(indexType: indexType)
        view.presenter.sortBy(type: type)
        
        // Assert
        XCTAssertNotNil(presenter.indexType)
        XCTAssertEqual(presenter.indexType, indexType)
        
        XCTAssertNotNil(presenter.typeSort)
        XCTAssertEqual(presenter.typeSort, type)
    }
    
    func testfetchProducts() throws {
        // Arrange
        let view = CatalogView()
        presenter = MockCatalogPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        // Act
        XCTAssertEqual(presenter.products, nil)
        view.presenter.fetchProducts()
        
        // Assert
        XCTAssertNotEqual(presenter.products, nil)
    }
    
    func testResetProducts() throws {
        // Arrange
        let view = CatalogView()
        presenter = MockCatalogPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        // Act
        XCTAssertEqual(presenter.products, nil)
        view.presenter.resetProducts()
        
        // Assert
        XCTAssertNotEqual(presenter.products, nil)
    }
    
    func testGetProducts() throws {
        // Arrange
        let view = CatalogView()
        presenter = MockCatalogPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        // Act
        XCTAssertEqual(presenter.getProducts(), nil)
        view.presenter.fetchProducts()
        
        // Assert
        XCTAssertNotEqual(presenter.getProducts(), nil)
    }
    
    func testTapOnProduct() throws {
        // Arrange
        let view = CatalogView()
        presenter = MockCatalogPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        let product = CatalogProduct()
        
        // Act
        XCTAssertEqual(presenter.getProducts(), nil)
        view.presenter.tapOnProduct(product: product)
        
        // Assert
        XCTAssertEqual(presenter.typedProduct, product)
    }
}
