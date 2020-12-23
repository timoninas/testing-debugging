import XCTest

class CartUITest: XCTestCase {
    func testAddDeleteFromCart() {
        let app = XCUIApplication()
        app.launch()
        let collectionViewsQuery = app.collectionViews
        let emptybuyButton = collectionViewsQuery.cells.containing(.staticText, identifier:"ПУХОВИК HELIONIC").buttons["emptyBuy"]
        emptybuyButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.6);/*[[".tap()",".press(forDuration: 0.6);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let emptybuyButton2 = collectionViewsQuery.cells.containing(.staticText, identifier:"КРОССОВКИ NITE JOGGER").buttons["emptyBuy"]
        emptybuyButton2.tap()
        emptybuyButton.tap()
        emptybuyButton2.tap()
        app.tabBars["Tab Bar"].children(matching: .button).element(boundBy: 2).tap()
        
        let tablesQuery = app.tables
        let emptycancelButton = tablesQuery.children(matching: .cell).element(boundBy: 0).buttons["emptyCancel"]
        emptycancelButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        emptycancelButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.6);/*[[".tap()",".press(forDuration: 0.6);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"11999.0 РУБ.").buttons["emptyCancel"].press(forDuration: 0.5);/*[[".cells.containing(.staticText, identifier:\"ПУХОВИК HELIONIC\").buttons[\"emptyCancel\"]",".tap()",".press(forDuration: 0.5);",".cells.containing(.staticText, identifier:\"11999.0 РУБ.\").buttons[\"emptyCancel\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["emptyCancel"].press(forDuration: 0.5);/*[[".cells.buttons[\"emptyCancel\"]",".tap()",".press(forDuration: 0.5);",".buttons[\"emptyCancel\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
    }
}
