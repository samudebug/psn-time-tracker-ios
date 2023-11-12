//
//  ContentView.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authHelper = AuthHelper()
    var body: some View {
        NavigationView {
            if authHelper.token.isEmpty {
                
                TokenInput()
            } else {
                GamesPage()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
