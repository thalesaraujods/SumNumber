//
//  SumViewModelTests.swift
//  SumNumberTests
//
//  Created by Thales Araújo on 15/09/25.
//

import XCTest
import os.log
@testable import SumNumber

final class SumViewModelTests: XCTestCase {
    
    private let logger = Logger(category: "SumViewModelTests")
    var sumViewModel: SumViewModel?
    
    // MARK: - Setup
    override func setUpWithError() throws {
        try super.setUpWithError()
        sumViewModel = SumViewModel()
        logger.debug(">>> setUp chamado")
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sumViewModel = nil
        logger.debug(">>> tearDown chamado")
    }
    
    // MARK: - Testes
    func test_GivenEmptyStrings_WhenSumming_ShouldReturnNil() throws {
        logger.debug(">>> test_GivenEmptyStrings_WhenSumming_ShouldReturnNil chamado")
        
        // - ARRANGE: Preparar o ambiente e os dados para o teste.
        let number1 = ""
        let number2 = ""
        let expectedResult: Int? = nil
        
        guard let viewModel = sumViewModel else {
            XCTFail("SumViewModel não foi instanciado corretamente.")
            return
        }
        
        // - ACT: Executar a ação ou a lógica que você quer testar.
        viewModel.sumNumbers(a: number1, b: number2)
        
        // - ASSERT: Verificar o resultado da ação usando uma assertion.
        XCTAssertEqual(viewModel.resultado, expectedResult)
    }
    
    func test_GivenOneEmptyNumber_WhenSumming_ShouldReturnNil() {
        logger.debug(">>> test_GivenOneEmptyNumber_WhenSumming_ShouldReturnNil chamado")
        
        // - ARRANGE
        let number1 = ""
        let number2 = "5"
        
        guard let viewModel = sumViewModel else {
            XCTFail("SumViewModel não foi instanciado corretamente.")
            return
        }
        
        // - ACT
        viewModel.sumNumbers(a: number1, b: number2)
        
        // - ASSERT
        XCTAssertNil(viewModel.resultado)
    }
    
    func test_GivenInvalidString_WhenSumming_ShouldReturnNil() {
        logger.debug(">>> test_GivenInvalidString_WhenSumming_ShouldReturnNil chamado")
        
        // - ARRANGE
        let number1 = "abc"
        let number2 = "cde"
        
        guard let viewModel = sumViewModel else {
            XCTFail("ViewModel não foi inicializado")
            return
        }
        
        // - ACT
        viewModel.sumNumbers(a: number1, b: number2)
        
        // - ASSERT
        XCTAssertTrue(viewModel.resultado == nil, "Resultado deve ser nulo para números inválidos!")
    }
    
    func test_GivenPositiveNumbers_WhenSumming_ShouldReturnCorrectResult() {
        logger.debug(">>> test_GivenPositiveNumbers_WhenSumming_ShouldReturnCorrectResult chamado")
        
        // - ARRANGE
        let number1 = "4"
        let number2 = "5"
        let expectedResult = 9
        
        guard let viewModel = sumViewModel else {
            XCTFail("ViewModel não foi inicializado")
            return
        }
        
        // - ACT
        viewModel.sumNumbers(a: number1, b: number2)
        
        // - ASSERT
        XCTAssertEqual(viewModel.resultado, expectedResult)
    }
    
    func test_GivenNegativeNumbers_WhenSumming_ShouldReturnCorrectResult() {
        logger.debug(">>> test_GivenNegativeNumbers_WhenSumming_ShouldReturnCorrectResult chamado")
        
        // - ARRANGE
        let number1 = "-4"
        let number2 = "-5"
        let expectedResult = -9
        
        guard let viewModel = sumViewModel else {
            XCTFail("ViewModel não foi inicializada")
            return
        }
        
        // - ACT
        viewModel.sumNumbers(a: number1, b: number2)
        
        
        // - ASSERT
        XCTAssertEqual(viewModel.resultado, expectedResult)
    }
}
