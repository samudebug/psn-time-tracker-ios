//
//  Game.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation

struct Game: Hashable, Codable, Identifiable {
    var title_id: String
    var id: String {
        title_id
    }
    var name: String
    var image_url: String
    var total_play_duration: String
}
