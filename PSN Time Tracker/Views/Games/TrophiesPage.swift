//
//  TrophiesPage.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct TrophiesPage: View {
    var titleId: String
    var group: TrophyGroup
    @State var trophies: [Trophy] = []
    @State var loading: Bool = true
    
    var body: some View {
        VStack {
            TrophyGroupRow(trophyGroup: group)
            if loading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
                TrophyInfo(trophies: trophies)
                TrophiesList(trophies: trophies)
            }
            
        }.animation(.spring(), value: loading).onAppear {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                trophies =  [Trophy(name: "Não sou vacilão", description: "Desbloqueie todos os troféus.", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/DC17D1D9E6141159A4D7862E1FF539B8AD0167F2.PNG", type:  "platinum", earned: false),
                             Trophy(name: "Primeiros passos", description: "Complete \"Big Smoke\".", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/A775E6853ECBAFA6200FA8FE819C9C53E9CAA8A5.PNG", type: "bronze", earned: true)]
                loading = false
            } else {
                Task {
                    let data = await TrophyData().fetchTrophies(titleId: titleId, groupId: group.group_id)
                    await MainActor.run {
                        trophies = data
                        loading = false
                    }
                }
            }
        }
    }
}

#Preview {
    TrophiesPage(titleId: "", group: TrophyGroup(group_id: "default", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/17F5F546C77B4A41D59ABE3DF86CCB91FF076F0B.PNG", name: "Grand Theft Auto: San Andreas – The Definitive Edition"))
}
