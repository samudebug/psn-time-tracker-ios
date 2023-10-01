//
//  TokenInput.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 01/10/23.
//

import SwiftUI

struct TokenInput: View {
    @State var token: String
    @AppStorage("ssoToken") var ssoToken: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text("1. Faça Login no site da [Playstation](https://store.playstation.com)")
            Text("2. Abra [Este Link](https://ca.account.sony.com/api/v1/ssocookie)")
            Text("3. Copie o valor de 'npsso' e o cole abaixo")
            TextField("npsso", text: $token).border(.primary).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Button {
                ssoToken = $token.wrappedValue
            } label: {
                Text("Login")
            }.buttonStyle(.borderedProminent)
        }.padding()
    }
}

#Preview {
    TokenInput(token: "")
}
