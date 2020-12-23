//
//  lab_1UITests.swift
//  lab_1UITests
//
//  Created by Антон Тимонин on 16.10.2020.
//

import XCTest

class CatalogUITest: XCTestCase {
    func testFilterProducts() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let filterCell = app.collectionViews.cells.containing(.button, identifier:"Filter").element
        filterCell.tap()
        
        let elementsQuery = app.sheets["Filter products"].scrollViews.otherElements
        let byProductTypeButton = elementsQuery.buttons["By product type"]
        byProductTypeButton.tap()
        filterCell.tap()
        elementsQuery.buttons["From high price to low"].tap()
        filterCell.tap()
        elementsQuery.buttons["From low price to high"].tap()
    }
    
    func testTypedProducts() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = XCUIApplication().collectionViews
        let allCell = collectionViewsQuery.cells.containing(.button, identifier:"All").element
        allCell.tap()
        collectionViewsQuery.cells.containing(.button, identifier:"Clothes").element.tap()
        collectionViewsQuery.cells.containing(.button, identifier:"Shoes").element.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Accessories"]/*[[".cells.buttons[\"Accessories\"]",".buttons[\"Accessories\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        allCell.tap()
    }
    
    func testViewProducts() throws {
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.cells.containing(.staticText, identifier:"ПУХОВИК HELIONIC").element.tap()
        
        let oneShopButton = app.navigationBars["lab_1.DetailView"].buttons["One Shop"]
        oneShopButton.tap()
        collectionViewsQuery.cells.containing(.staticText, identifier:"КРОССОВКИ NITE JOGGER").element.tap()
        oneShopButton.tap()
        collectionViewsQuery.cells.containing(.staticText, identifier:"КРОССОВКИ STREETBALL").element.tap()
        oneShopButton.tap()
        app.collectionViews.containing(.other, identifier:"Horizontal scroll bar, 1 page").children(matching: .cell).element(boundBy: 3).tap()
        oneShopButton.tap()
        app.collectionViews.containing(.other, identifier:"Horizontal scroll bar, 1 page").element.swipeUp()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"КРОССОВКИ FYW XTA").element/*[[".cells.containing(.staticText, identifier:\"12999.0 РУБ.\").element",".cells.containing(.staticText, identifier:\"КРОССОВКИ FYW XTA\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        oneShopButton.tap()
        collectionViewsQuery.cells.containing(.staticText, identifier:"ХУДИ R.Y.V.").element.tap()
        oneShopButton.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"ХУДИ BACK + FRONT PRINT TREFOIL").element/*[[".cells.containing(.staticText, identifier:\"5499.0 РУБ.\").element",".cells.containing(.staticText, identifier:\"ХУДИ BACK + FRONT PRINT TREFOIL\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        oneShopButton.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"БРЮКИ M JQRD FTW").element/*[[".cells.containing(.staticText, identifier:\"7499.0 РУБ.\").element",".cells.containing(.staticText, identifier:\"БРЮКИ M JQRD FTW\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        oneShopButton.tap()
    }
}
