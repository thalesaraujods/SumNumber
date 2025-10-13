//
//  SumViewModelUITests.swift
//  SumNumberUITests
//
//  Created by Thales Araújo on 22/09/25.
//

import XCTest
import SwiftUI
@testable import SumNumber

final class SumViewUITests: XCTestCase {
    
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
    
    // MARK: - Helpers
    private func navigateToSumView(file: StaticString = #filePath, line: UInt = #line) {
        let calcularButton = app.buttons["Calcular"]
        XCTAssertTrue(calcularButton.waitForExistence(timeout: defaultTimeout), "Botão 'Calcular' não encontrado na HomeView", file: file, line: line)
        calcularButton.tap()
        
        let sumTitle = app.staticTexts["tituloCalculadoraText"]
        XCTAssertTrue(sumTitle.waitForExistence(timeout: defaultTimeout), "SumView não apareceu após tocar em 'Calcular'", file: file, line: line)
    }
    
    // MARK: - Tests (SumView)
    func test_GivenSum_WhenViewingInitialScreen_ThenResultsIsNil() throws {
        // - Arrange
        navigateToSumView()
        
        // - Act
        XCTContext.runActivity(named: "When no interaction happens") { _ in }
        
        // - Assert
        XCTContext.runActivity(named: "Then 'Somar' button exists") { _ in
            let textResult = app.staticTexts["resultadoText"]
            XCTAssertTrue(textResult.exists)
            XCTAssertEqual(textResult.label, "Resultado: Sem valor")
        }
    }
    
    func test_GivenTwoNumbers_WhenTapSum_ThenShowCorrectsResult() throws {
        // - Arrange
        navigateToSumView()
        
        let number1 = app.textFields["numero1TextField"]
        let number2 = app.textFields["numero2TextField"]
        let sumButton = app.buttons["Somar"]
        let textResult = app.staticTexts["resultadoText"]
        
        XCTContext.runActivity(named: "Given two numbers") { _ in
            XCTAssertNotNil(number1)
            XCTAssertNotNil(number2)
            XCTAssertNotNil(sumButton)
            XCTAssertNotNil(textResult)
        }
        
        // - Act
        number1.tap()
        number1.typeText("10")
        
        number2.tap()
        number2.typeText("20")
        
        sumButton.tap()
        
        // - Assert
        XCTAssertEqual(textResult.label, "Resultado: 30")
    }
    
    func test_GivenTwoNumbers_WhenTapSumWithInvalidNumber_ThenShowError() throws {
        // - Arrange
        navigateToSumView()
        
        let number1 = app.textFields["numero1TextField"]
        let number2 = app.textFields["numero2TextField"]
        let sumButton = app.buttons["Somar"]
        let erroResult = app.staticTexts["errorText"]
        
        // - Act
        number1.tap()
        number1.typeText("10")
        number2.tap()
        number2.typeText("20t")
        sumButton.tap()
        
        // - Assert
        XCTAssertNotNil(erroResult)
    }
}
