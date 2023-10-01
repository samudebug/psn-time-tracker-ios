//
//  TrophyData.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation

final class TrophyData {
    func fetchTrophies(titleId: String, groupId: String) async -> [Trophy] {
        do {
            return try await APIHelper().performGet(path: "/get_trophies/\(titleId)/\(groupId)")
        } catch {
            return []
        }
    }
}
