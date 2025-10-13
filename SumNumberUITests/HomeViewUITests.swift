//
//  HomeView.swift
//  SumNumberUITests
//
//  Created by Thales Araújo on 29/09/25.
//

import XCTest

final class HomeViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private let defaultTimeout: TimeInterval = 2.0
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    // MARK: - Tests
    func test_GivenAppLaunched_WhenViewingHome_ThenCalcularButtonExists() throws {
        // - Arrange
        XCTContext.runActivity(named: "Given app is launched") {_ in
            XCTAssertNotNil(app, "Error launching app")
        }
        
        // - Assert
        let calcularButton = app.buttons["Calcular"]
        
        // - ACT
        XCTAssertTrue(calcularButton.waitForExistence(timeout: defaultTimeout), "Botão 'Calcular' deveria existir na HomeView")
    }
    
    func test_GivenHome_WhenTapCalcular_ThenNavigatesToSumView() throws {
        // - Arrange
        XCTContext.runActivity(named: "Given app is launched") {_ in
            XCTAssertNotNil(app, "Error launching app")
        }
        
        // - Assert
        let calcularButton = app.buttons["Calcular"]
        XCTAssertTrue(calcularButton.waitForExistence(timeout: defaultTimeout), "Botão 'Calcular' deveria existir na HomeView")
        calcularButton.tap()
        
        // - Assert
        let sumTitle = app.staticTexts["tituloCalculadoraText"]
        XCTAssertTrue(sumTitle.waitForExistence(timeout: defaultTimeout), "Título da calculadora deveria estar visível na SumView")
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "SumView in show"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
