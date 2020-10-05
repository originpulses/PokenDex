//
//  PokenDexUITests.swift
//  PokenDexUITests
//
//  Created by Sabih on 25/7/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import XCTest

class PokenDexUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test to check TabBar Navigation
    func testForTabBarNavigation() {
        
        let tabBarQuery = XCUIApplication().tabBars
        
        let pokendexButton = tabBarQuery.buttons["PokenDex"]
        pokendexButton.tap()
        XCTAssert(pokendexButton.isSelected)
        
        let favouritesButton = tabBarQuery.buttons["Favourites"]
        favouritesButton.tap()
        XCTAssert(favouritesButton.isSelected)
        
        let identifyButton = tabBarQuery.buttons["Identify"]
        identifyButton.tap()
        XCTAssert(identifyButton.isSelected)
        
        let devTeamButton = tabBarQuery.buttons["Dev Team"]
        devTeamButton.tap()
        XCTAssert(devTeamButton.isSelected)
        
        identifyButton.tap()
        XCTAssert(identifyButton.isSelected)
        
        favouritesButton.tap()
        XCTAssert(favouritesButton.isSelected)
        
        pokendexButton.tap()
        XCTAssert(pokendexButton.isSelected)
    }
    
    func testForAddingPokemonToFavourites() {
        
        // Pre-Condition: There should be no favourites initially
        
        XCUIApplication().tabBars.buttons["PokenDex"].tap()
        sleep(5)
        
        let app = XCUIApplication()
        app.collectionViews.staticTexts["Charizard"].press(forDuration: 1)
        
        let alert = app.alerts["AddingAlert"]
        let alertButton = alert.buttons["Add Pokemon"]
        alertButton.tap()
        sleep(2)
        
        XCUIApplication().tabBars.buttons["Favourites"].tap()
        
        let favTable = app.tables.matching(identifier: "favouritesTable")
        XCTAssertEqual(favTable.cells["favCell_0"].staticTexts["nameLabel"].label, "Charizard")
        
    }
    
    func testForDeletingPokemon() {
        
        // Pre-Condition: Add the favourite through testForFavouritingPokemon() function first
        
        XCUIApplication().tabBars.buttons["Favourites"].tap()
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Charizard"].swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
        XCTAssert(tablesQuery.staticTexts["Charizard"].exists == false)
        
    }
    
    func testForPokemonDetailUseCase() {
        
        XCUIApplication().tabBars.buttons["PokenDex"].tap()
        sleep(5)
        
        let app = XCUIApplication()
        app.collectionViews.staticTexts["Charizard"].tap()
        sleep(5)
        
        XCTAssert(app.staticTexts["Charizard"].exists)
        XCTAssert(app.staticTexts["#006"].exists)
        XCTAssert(app.staticTexts["Fire"].exists)
        
        XCTAssertTrue(app.segmentedControls.buttons["Description"].exists)
        XCTAssertTrue(app.segmentedControls.buttons["Description"].isSelected)
        
        let statsSegment = app.segmentedControls.buttons["Stats"]
        statsSegment.tap()
        XCTAssertTrue(statsSegment.isSelected)
        XCTAssertTrue(statsSegment.exists)
        
    }
    
}
