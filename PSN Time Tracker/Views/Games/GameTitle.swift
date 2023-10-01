//
//  GameTitle.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct GameTitle: View {
    var game: Game
    var body: some View {
        HStack {
            AsyncImage(url: URL(string:"https://image.api.playstation.com/vulcan/ap/rnd/202110/2814/4adJ0gjnFRysR59iJSZJFQ1J.png")){image in image.image?.resizable().cornerRadius(8)}.frame(width: 80,height: 80).padding()
            Text("Grand Theft Auto: San Andreas - The Definitive Edition")
        }
    }
}

#Preview {
    GameTitle(game: GamesData().gamesMocked[0])
}
