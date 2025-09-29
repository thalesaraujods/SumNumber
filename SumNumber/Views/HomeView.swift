//
//  HomeView.swift
//  SumNumber
//
//  Created by Thales Araújo on 29/09/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var path: NavigationPath = .init()
    
    var body: some View {
        NavigationStack (path: $path) {
            VStack {
                Button("Calcular", action: {
                    path.append(SumView.tag)
                })
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(for: String.self, destination: {_ in
                SumView()
            })
        }
        
    }
}

#Preview {
    HomeView()
}
