//
//  SumView.swift
//  SumNumber
//
//  Created by Thales Araújo on 08/09/25.
//

import SwiftUI

struct SumView: View {
    
    @StateObject var vm: SumViewModel = SumViewModel()
    @State var number1: String = ""
    @State var number2: String = ""
    static let tag = "SumView"
    
    var body: some View {
        VStack(spacing: 20){
            Text("Calculadora básica")
                .font(.largeTitle)
                .fontWeight(.bold)
                .accessibilityIdentifier("tituloCalculadoraText")
            
            TextField("Número 1:", text: $number1)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .accessibilityIdentifier("numero1TextField")
            
            
            TextField("Número 2:", text: $number2)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .accessibilityIdentifier("numero2TextField")
            
            
            Button("Somar", action: {
                vm.error = nil
                vm.sumNumbers(a: number1, b: number2)
            })
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .accessibilityIdentifier("somarButton")
            
            
            
            Text("Resultado: \(vm.resultado.map(String.init) ?? "Sem valor")")
                .font(.title2)
                .bold()
                .accessibilityIdentifier("resultadoText")
            
            if let error = vm.error {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .accessibilityIdentifier("errorText")
            }
        }
        .padding()
    }
}

#Preview {
    SumView()
}

