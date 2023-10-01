//
//  TrophyGroupData.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation

final class TrophyGroupData {
    func fetchTrophyGroups(titleId: String) async -> [TrophyGroup]{
        do {
            let trophyGroupsWrapper: TrophyGroupWrapper = try await APIHelper().performGet(path: "/get_trophy_groups/\(titleId)")
            return trophyGroupsWrapper.groups
        } catch {
            return []
        }
    }
}
