//
//  E2EUITest.swift
//  lab_1UITests
//
//  Created by Антон Тимонин on 22.12.2020.
//

import XCTest

class E2EUITest: XCTestCase {
    func testE2E() throws {
        let app = XCUIApplication()
        app.launch()
        let collectionViewsQuery2 = app.collectionViews
        let collectionViewsQuery = collectionViewsQuery2
        collectionViewsQuery.cells.containing(.button, identifier:"Clothes").element.tap()
        collectionViewsQuery.cells.containing(.button, identifier:"Shoes").element.tap()
        
        let filterCell = collectionViewsQuery.cells.containing(.button, identifier:"Filter").element
        filterCell.tap()
        
        let elementsQuery2 = app.sheets["Filter products"].scrollViews.otherElements
        let fromHighPriceToLowButton = elementsQuery2.buttons["From high price to low"]
        fromHighPriceToLowButton.tap()
        filterCell.tap()
        
        let elementsQuery = elementsQuery2
        elementsQuery.buttons["From low price to high"].tap()
        
        let streetballCellsQuery = collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"КРОССОВКИ STREETBALL")/*[[".cells.containing(.staticText, identifier:\"11999.0 РУБ.\")",".cells.containing(.staticText, identifier:\"КРОССОВКИ STREETBALL\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        streetballCellsQuery.buttons["emptyFavourite"].tap()
        
        let niteJoggerCellsQuery = collectionViewsQuery.cells.containing(.staticText, identifier:"КРОССОВКИ NITE JOGGER")
        niteJoggerCellsQuery.buttons["emptyFavourite"].tap()
        filterCell.tap()
        fromHighPriceToLowButton.tap()
        niteJoggerCellsQuery.buttons["emptyBuy"].tap()
        
        app.collectionViews.containing(.other, identifier:"Horizontal scroll bar, 1 page").children(matching: .cell).element(boundBy: 1).buttons["emptyBuy"].tap()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.children(matching: .button).element(boundBy: 1).tap()
        streetballCellsQuery.buttons["emptyBuy"].tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"КРОССОВКИ NITE JOGGER")/*[[".cells.containing(.staticText, identifier:\"12999.0 РУБ.\")",".cells.containing(.staticText, identifier:\"КРОССОВКИ NITE JOGGER\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["emptyBuy"].tap()
        streetballCellsQuery.buttons["filledFavourite"].tap()
        collectionViewsQuery2/*@START_MENU_TOKEN@*/.buttons["filledFavourite"]/*[[".cells.buttons[\"filledFavourite\"]",".buttons[\"filledFavourite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tabBar.children(matching: .button).element(boundBy: 2).tap()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).buttons["emptyCancel"]/*@START_MENU_TOKEN@*/.press(forDuration: 0.6);/*[[".tap()",".press(forDuration: 0.6);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tablesQuery.cells.containing(.staticText, identifier:"КРОССОВКИ FYW XTA").buttons["emptyCancel"]/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"11999.0 РУБ.").buttons["emptyCancel"].press(forDuration: 0.5);/*[[".cells.containing(.staticText, identifier:\"КРОССОВКИ STREETBALL\").buttons[\"emptyCancel\"]",".tap()",".press(forDuration: 0.5);",".cells.containing(.staticText, identifier:\"11999.0 РУБ.\").buttons[\"emptyCancel\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app.tables/*@START_MENU_TOKEN@*/.buttons["emptyCancel"].press(forDuration: 0.6);/*[[".cells.buttons[\"emptyCancel\"]",".tap()",".press(forDuration: 0.6);",".buttons[\"emptyCancel\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        tabBar.children(matching: .button).element(boundBy: 0).tap()
        collectionViewsQuery.cells.containing(.button, identifier:"All").element.tap()
        filterCell.tap()
        elementsQuery.buttons["By product type"].tap()
    }
}
