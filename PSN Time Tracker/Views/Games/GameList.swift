//
//  GameList.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct GameList: View {
    var games: [Game]
    var body: some View {
        List {
            ForEach(games) { game in
                NavigationLink {
                    TrophyGroupsPage(game: game)
                } label: {
                    GameCard(game: game)
                }.buttonStyle(.plain)
            }
        }.listStyle(.plain).navigationTitle("Games")
    }
}

#Preview {
    GameList(games: GamesData().gamesMocked)
}
