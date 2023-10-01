//
//  TrophyGroupRow.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct TrophyGroupRow: View {
    var trophyGroup: TrophyGroup
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: trophyGroup.icon)) {
                image in
                image.image?.resizable().cornerRadius(10)
            }.frame(width: 40, height: 40)
            Text(trophyGroup.name)
        }
    }
}

#Preview {
    TrophyGroupRow(trophyGroup: TrophyGroup(group_id: "default", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/17F5F546C77B4A41D59ABE3DF86CCB91FF076F0B.PNG", name: "Grand Theft Auto: San Andreas – The Definitive Edition"))
}
