import XCTest
import CoreData
@testable import lab_1

class MockCatalogView: CatalogInputProtocol {
    func success() {
        
    }
    
    func failure() {
        
    }
}

class MockNetworkService: NetworkServiceProtocol {
    
    var products: [Product]!
    
    init() {}
    
    convenience init(products: [Product]) {
        self.init()
        self.products = [Product]()
        self.products.append(contentsOf: products)
    }
    
    func fetchCatalog(completion: @escaping (Result<[CatalogProduct]?, Error>) -> ()) {
        if let products = self.products {
            var catalogProducts = [CatalogProduct]()
            catalogProducts.append(CatalogProduct())
            completion(.success(catalogProducts))
        } else {
            let error = NSError(domain: "", code: 0 , userInfo: nil)
            completion(.failure(error))
        }
    }
}

class CatalogViewTest: XCTestCase {
    var view: MockCatalogView!
    var presenter: CatalogOutputProtocol!
    var networkService: NetworkServiceProtocol!
    var router: RouterCatalogProtocol!
    var product: Product!
    
    override func setUp() {
        let navigationController = UINavigationController()
        let builder = BuilderCatalog()
        router = RouterCatalog(navigationController: navigationController, builder: builder)
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testGetSuccess() throws {
        let product = Product(name: "Dummy", price: 0, type: "clothes")
        
        view = MockCatalogView()
        networkService = MockNetworkService(products: [product])
        
        presenter = CatalogPresenter(view: view, networkService: networkService, router: router)
        
        var geting_roducts: [CatalogProduct]?
        
        networkService.fetchCatalog { (result) in
            switch result {
            case .success(let products):
                geting_roducts = products
                self.view.success()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        XCTAssertNotEqual(geting_roducts?.count, 0)
    }
    
    func testGetFailure() throws {
        view = MockCatalogView()
        networkService = MockNetworkService()
        
        presenter = CatalogPresenter(view: view, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.fetchCatalog { (result) in
            switch result {
            case .success(let products):
                print("Success")
            case .failure(let error):
                catchError = error
                self.view.failure()
            }
        }
        
        XCTAssertNotNil(catchError)
    }
}
