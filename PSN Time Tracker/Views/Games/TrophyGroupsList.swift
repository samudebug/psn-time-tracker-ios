//
//  TrophyGroupsList.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct TrophyGroupsList: View {
    var trophyGroups: [TrophyGroup]
    var titleId: String
    var body: some View {
        List {
            ForEach(trophyGroups) { trophyGroup in
                NavigationLink {
                    TrophiesPage(titleId: titleId, group: trophyGroup)
                } label: {
                    TrophyGroupRow(trophyGroup: trophyGroup)
                }
            }
        }
    }
}

#Preview {
    TrophyGroupsList(trophyGroups: [TrophyGroup(group_id: "default", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/17F5F546C77B4A41D59ABE3DF86CCB91FF076F0B.PNG", name: "Grand Theft Auto: San Andreas – The Definitive Edition")], titleId: "")
}
