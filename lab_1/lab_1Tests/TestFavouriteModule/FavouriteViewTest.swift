import XCTest
import CoreData
@testable import lab_1

class MockFavouriteView: FavouriteInputProtocol {
    public var isSuccess: Bool?
    
    func success() {
        isSuccess = true
    }
    
    func failure() {
        isSuccess = false
    }
}

class MockCoreDataForFavourite: FavouriteAccessProtocol {
    public var isNeedSuccess: Bool = true
    
    func getFavourite() -> [FavouriteProduct] {
        if isNeedSuccess == true {
            return [FavouriteProduct()]
        } else {
            return [FavouriteProduct]()
        }
    }
}

extension FavouritePresenter {
    func setZeroValueProducts() {
        self._favouriteProducts = [FavouriteProduct]()
    }
}

class FavouriteViewTest: XCTestCase {
    var view: MockFavouriteView!
    var presenter: FavouriteOutputProtocol!
    var router: RouterFavouriteProtocol!
    var coreDataManager: MockCoreDataForFavourite!
    
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

    func testGetSuccess() throws {
        // Arrange
        view = MockFavouriteView()
        coreDataManager = MockCoreDataForFavourite()
        presenter = FavouritePresenter(view: view, coreDataManager: coreDataManager, router: router)
        
        // Act
        presenter.fetchFavourite()
        
        // Assert
        XCTAssertEqual(view.isSuccess, true)
        XCTAssertNotNil(view.isSuccess)
    }
    
    func testGetFailure() throws {
        // Arrange
        view = MockFavouriteView()
        coreDataManager = MockCoreDataForFavourite()
        presenter = FavouritePresenter(view: view, coreDataManager: coreDataManager, router: router)
        
        // Act
        coreDataManager.isNeedSuccess = false
        presenter.fetchFavourite()
        
        // Assert
        XCTAssertEqual(view.isSuccess, false)
        XCTAssertNotNil(view.isSuccess)
    }
}
