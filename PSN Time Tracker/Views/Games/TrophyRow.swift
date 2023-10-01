//
//  TrophyRow.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct TrophyRow: View {
    var trophy: Trophy
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: trophy.icon)) {
                image in
                image.image?.resizable()
            }.frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(trophy.name).font(.title3)
                Text(trophy.description).font(.caption)
            }
            Spacer()
            if trophy.earned {
                Image(systemName: "checkmark.circle")
            }
        }.padding()
    }
}

#Preview {
    TrophyRow(trophy: Trophy(name: "Não sou vacilão", description: "Desbloqueie todos os troféus.", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/DC17D1D9E6141159A4D7862E1FF539B8AD0167F2.PNG", type:  "platinum", earned: true))
}
