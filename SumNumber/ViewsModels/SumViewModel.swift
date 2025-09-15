//
//  SumViewModel.swift
//  SumNumber
//
//  Created by Thales Araújo on 08/09/25.
//

import SwiftUI

class SumViewModel: ObservableObject {
    @Published var resultado: Int? = nil
    @Published var error: String? = nil
    
    func sumNumbers(a: String, b: String) {
        if let number1 = Int(a), let number2 = Int(b) {
            resultado = number1 + number2
        } else {
            error = "Por favor, insira apenas números inteiros."
        }
    }
}
