//
//  GamesData.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation
import Combine

final class GamesData: ObservableObject {
    @Published var games: [Game] = []
    @Published var gamesMocked: [Game] = [
        Game(title_id: "CUSA26619_00", name: "Grand Theft Auto San Andreas - The Definitive Edition", image_url: "https://image.api.playstation.com/vulcan/ap/rnd/202110/2814/4adJ0gjnFRysR59iJSZJFQ1J.png", total_play_duration: "36 horas 39 minutos"),
        Game(title_id: "CUSA26619_001", name: "Grand Theft Auto San Andreas - The Definitive Edition", image_url: "https://image.api.playstation.com/vulcan/ap/rnd/202110/2814/4adJ0gjnFRysR59iJSZJFQ1J.png", total_play_duration: "36 horas 39 minutos"),
        
    ]
    
   
    func fetchGames() async {
        do {
            let games: [Game] = try await APIHelper().performGet(path: "/get_stats")
            await MainActor.run {
                self.games = games
            }
        } catch {
            fatalError("Not able to load games, \(error)")
        }
    }
 }
