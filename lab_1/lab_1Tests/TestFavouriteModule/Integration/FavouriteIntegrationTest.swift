import XCTest
import CoreData
@testable import lab_1

class FavouriteIntegrationTest: XCTestCase {
    var coreDataManagerTst: CoreDataManagerTst!
    
    override func setUp() {
        coreDataManagerTst = CoreDataManagerTst()
    }
    
    override func tearDown() {
        coreDataManagerTst = nil
    }
    
    func testFetchProducts() throws {
        // Arrange
        let product1 = Product(name: "Dummy Product1", price: 1990, type: "clothes")
        let product2 = Product(name: "Dummy Product2", price: 1990, type: "clothes")
        
        // Act
        coreDataManagerTst.addProductToFavourite(product: product1)
        coreDataManagerTst.addProductToFavourite(product: product2)
        let products = coreDataManagerTst.getFavourite()
        
        // Assert
        XCTAssertEqual(products.count, 2)
        
        products.forEach {
            if ($0.name != product1.name && $0.name != product2.name) {
                XCTAssert(false)
            }
        }
    }
    
    func testAddProduct() throws {
        // Arrange
        let product = Product(name: "Dummy Product", price: 1990, type: "clothes")
        
        // Act
        coreDataManagerTst.addProductToFavourite(product: product)
        let products = coreDataManagerTst.getFavourite()
        var findedProduct: Product? = nil
        products.forEach { (arrProduct) in
            if (arrProduct.name == product.name && arrProduct.price == product.price && arrProduct.type == product.type) {
                findedProduct = coreDataProductToProduct(product: arrProduct)
            }
        }
        
        // Assert
        XCTAssertNotNil(findedProduct)
        XCTAssertEqual(findedProduct?.name, product.name)
        XCTAssertEqual(findedProduct?.price, product.price)
        XCTAssertEqual(findedProduct?.type, product.type)
    }
    
    func testDeleteProduct() throws {
        // Arrange
        let product = Product(name: "Dummy Product", price: 1990, type: "clothes")
        
        // Act
        coreDataManagerTst.addProductToFavourite(product: product)
        // fetch DB
        var products = coreDataManagerTst.getFavourite()
        XCTAssertNotEqual(products.count, 0)
        
        coreDataManagerTst.deleteProductFromFavourite(product: products.first!)
        
        // Assert
        // refetch DB
        products = coreDataManagerTst.getFavourite()
        XCTAssertEqual(products.count, 0)
    }
}
