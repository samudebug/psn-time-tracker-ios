//
//  GameCard.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct GameCard: View {
    var game: Game
    var body: some View {
        AsyncImage(url: URL(string: game.image_url)) { image in
            image.image?.resizable().aspectRatio(contentMode: .fill).overlay(TextOverlay(game: game))
        }.cornerRadius(10).frame(height: 330).padding()
        
    }
}

struct TextOverlay: View {
    var game: Game
    var gradient: LinearGradient {
            .linearGradient(Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
        }
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            HStack(alignment: .bottom) {
                Text(game.name).lineLimit(0).font(.title3)
                Spacer()
                Text(game.total_play_duration).font(.caption)
            }.padding()
        }.foregroundColor(.white)
    }
}

#Preview {
    GameCard(game: Game(title_id: "CUSA26619_00", name: "Grand Theft Auto San Andreas - The Definitive Edition", image_url: "https://image.api.playstation.com/vulcan/ap/rnd/202110/2814/4adJ0gjnFRysR59iJSZJFQ1J.png", total_play_duration: "36 horas 39 minutos"))
}
