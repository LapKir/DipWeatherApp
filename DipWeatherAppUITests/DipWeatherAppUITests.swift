//
//  DipWeatherAppUITests.swift
//  DipWeatherAppUITests
//
//  Created by Cyril on 22.09.21.
//

import XCTest

final class DipWeatherAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        app.launchArguments = ["enable testing"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testWarsawLabel() {
       
        let conditionCell = app.tables.element.cells.element(boundBy: 1)
        XCTAssertTrue(conditionCell.waitForExistence(timeout: 3))
        
        app.pickerWheels.element.adjust(toPickerWheelValue: "Warsaw")
        let value = app.pickerWheels.element(boundBy: 0).value as! String
        XCTAssertTrue(value == "Warsaw")
        sleep(5)
        app.buttons.element.tap()
        app.sheets["Select number of days"].buttons["3 DAYS"].tap()
        sleep(3)
        XCTAssertTrue(conditionCell.waitForExistence(timeout: 3))
        conditionCell.tap()
        let cityLabel = app.collectionViews.element
        XCTAssertTrue(cityLabel.waitForExistence(timeout: 2))
        XCTAssertTrue(cityLabel.staticTexts["city-name"].label == "Warsaw")
        
    }
}
