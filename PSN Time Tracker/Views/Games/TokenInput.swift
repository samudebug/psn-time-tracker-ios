//
//  TokenInput.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 01/10/23.
//

import SwiftUI

struct TokenInput: View {
    @State var presentingSheet = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Faça Login com a sua PSN para continuar")
            Button {
                presentingSheet.toggle()
            } label: {
                Text("Login")
            }.buttonStyle(.borderedProminent)
        }.padding().sheet(isPresented: $presentingSheet) {
            NavigationStack {
                WebView().toolbar {
                    Button {
                        presentingSheet.toggle()
                    } label: {
                        Text("Cancelar")
                    }
                }
            }
        }
    }
}

#Preview {
    TokenInput()
}
