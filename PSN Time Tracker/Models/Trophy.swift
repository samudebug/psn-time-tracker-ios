//
//  Trophy.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation

struct Trophy: Hashable, Codable, Identifiable {
    var name: String
    var description: String
    var icon: String
    var type: String
    var earned: Bool
    var id: String {
        name
    }
}
