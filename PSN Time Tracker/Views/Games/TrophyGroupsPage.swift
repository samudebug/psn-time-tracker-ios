//
//  TrophyGroupsPage.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct TrophyGroupsPage: View {
    var game: Game
    @State var trophyGroups: [TrophyGroup] = []
    @State var loading: Bool = true
    var body: some View {
        VStack {
            GameTitle(game: game)
            if loading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
                
            } else {
                TrophyGroupsList(trophyGroups: trophyGroups, titleId: game.title_id).navigationTitle("Groups")
            }
        }.animation(.spring(), value: loading).onAppear {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                trophyGroups = [TrophyGroup(group_id: "default", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/17F5F546C77B4A41D59ABE3DF86CCB91FF076F0B.PNG", name: "Grand Theft Auto: San Andreas – The Definitive Edition")]
                loading = false
            } else {
                Task {
                    let result = await TrophyGroupData().fetchTrophyGroups(titleId: game.title_id)
                    await MainActor.run {
                        self.loading = false
                        self.trophyGroups = result
                    }
                }
            }
        }
    }
}

#Preview {
    TrophyGroupsPage(game: Game(title_id: "CUSA26619_00", name: "Grand Theft Auto San Andreas - The Definitive Edition", image_url: "https://image.api.playstation.com/vulcan/ap/rnd/202110/2814/4adJ0gjnFRysR59iJSZJFQ1J.png", total_play_duration: "36 horas 39 minutos"))
}
