//
//  FavouriteUITest.swift
//  lab_1UITests
//
//  Created by Антон Тимонин on 22.12.2020.
//

import XCTest

class FavouriteUITest: XCTestCase {
    func testAddToFavourite() throws {
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        let emptyfavouriteButton = collectionViewsQuery.cells.containing(.staticText, identifier:"ПУХОВИК HELIONIC").buttons["emptyFavourite"]
        emptyfavouriteButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        emptyfavouriteButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        app.tabBars["Tab Bar"].children(matching: .button).element(boundBy: 1).tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).buttons["filledFavourite"].tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["filledFavourite"]/*[[".cells.buttons[\"filledFavourite\"]",".buttons[\"filledFavourite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

}
