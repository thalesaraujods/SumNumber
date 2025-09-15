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
    func test_GivenTwoNumbers_WhenNumbersAreEmpty_ShouldReturnZero() throws {
        
        logger.debug(">>> test_GivenTwoNumbers_WhenNumbersAreEmpty_ShouldReturnZero chamado")
        
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
    
    func test_GivenValidNumbers_WhenSumming_ShouldReturnCorrectResult() {
        
        logger.debug(">>> test_GivenValidNumbers_WhenSumming_ShouldReturnCorrectResult chamado")
        
        // - ARRANGE: Preparar o ambiente e os dados para o teste.
        let number1 = "4"
        let number2 = "5"
        let expectedResult = 9
        
        guard let viewModel = sumViewModel else {
            XCTFail("ViewModel não foi inicializado")
            return
        }
        
        // - ACT: Executar a ação ou a lógica que você quer testar.
        viewModel.sumNumbers(a: number1, b: number2)
        
        // - ASSERT: Verificar o resultado da ação usando uma assertion.
        XCTAssertEqual(viewModel.resultado, expectedResult)
    }
    
}
