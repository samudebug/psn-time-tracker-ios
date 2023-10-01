//
//  TrophyGroup.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation

struct TrophyGroupWrapper: Codable {
    var groups: [TrophyGroup]
}

struct TrophyGroup: Hashable, Codable, Identifiable {
    var group_id: String
    var icon: String
    var name: String
    var id: String {
        group_id
    }
}
