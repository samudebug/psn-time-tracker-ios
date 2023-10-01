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
            AsyncImage(url: URL(string:game.image_url)){image in image.image?.resizable().cornerRadius(8)}.frame(width: 80,height: 80).padding()
            Text(game.name)
        }
    }
}

#Preview {
    GameTitle(game: GamesData().gamesMocked[0])
}
