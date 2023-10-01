//
//  TrophiesList.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct TrophiesList: View {
    var trophies: [Trophy]
    var body: some View {
        List {
            ForEach(trophies) {trophy in
            TrophyRow(trophy: trophy)}
        }
    }
}

#Preview {
    TrophiesList(trophies: [Trophy(name: "Não sou vacilão", description: "Desbloqueie todos os troféus.", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/DC17D1D9E6141159A4D7862E1FF539B8AD0167F2.PNG", type:  "platinum", earned: false),
                            Trophy(name: "Primeiros passos", description: "Complete \"Big Smoke\".", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/A775E6853ECBAFA6200FA8FE819C9C53E9CAA8A5.PNG", type: "bronze", earned: true)])
}
