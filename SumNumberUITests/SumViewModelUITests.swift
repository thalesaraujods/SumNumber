//
//  SumViewModelUITests.swift
//  SumNumberUITests
//
//  Created by Thales Araújo on 22/09/25.
//

import XCTest
import SwiftUI
@testable import SumNumber

final class SumViewModelUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch() // Launches the app
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testSumButtonExist() throws {
        let buttonSum = app.buttons["Somar"]
        XCTAssertNotNil(buttonSum)
    }
    
    func testSumResultIsNilInitially() throws {
        let resultadoText = app.staticTexts["Resultado: Sem valor"]
        XCTAssertTrue(resultadoText.exists)
    }
    
    func testSumAfterTap() throws {
        // Pega o campo de texto, o botão e o elemento de resultado
        let campoNumero1 = app.textFields["numero1TextField"]
        let campoNumero2 = app.textFields["numero2TextField"]
        let botaoSomar = app.buttons["Somar"]

        // Simula a entrada de dados e o toque no botão
        campoNumero1.tap()
        campoNumero1.typeText("10")
        campoNumero2.tap()
        campoNumero2.typeText("20")
        botaoSomar.tap()

        // Verifica se o resultado correto é exibido
        let resultadoFinal = app.staticTexts["Resultado: 30"]
        XCTAssertTrue(resultadoFinal.exists)
    }
}
