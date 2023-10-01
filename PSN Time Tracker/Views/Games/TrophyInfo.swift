//
//  TrophyInfo.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct TrophyInfo: View {
    var trophies: [Trophy]
    var bronzeTrophies: Int {
        trophies.filter{ $0.type == "bronze"}.count
    }
    var silverTrophies: Int {
        trophies.filter{ $0.type == "silver"}.count
    }
    var goldTrophies: Int {
        trophies.filter{ $0.type == "gold"}.count
    }
    var platinumTrophies: Int {
        trophies.filter{ $0.type == "platinum"}.count
    }
    var progress: CGFloat {
        let earned = trophies.filter{$0.earned}.count
        return (CGFloat(earned) * 100.0) / CGFloat(trophies.count)
    }
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Bronze: \(bronzeTrophies)").font(.body)
                Text("Prata: \(silverTrophies)").font(.body)
                Text("Ouro : \(goldTrophies)").font(.body)
                Text("Platina: \(platinumTrophies)").font(.body)
            }
            Spacer()
            CircularProgressView(progress: progress / 100)
        }.padding()
    }
}

#Preview {
    TrophyInfo(trophies: [Trophy(name: "Não sou vacilão", description: "Desbloqueie todos os troféus.", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/DC17D1D9E6141159A4D7862E1FF539B8AD0167F2.PNG", type:  "platinum", earned: false),
                         Trophy(name: "Primeiros passos", description: "Complete \"Big Smoke\".", icon: "https://image.api.playstation.com/trophy/np/NPWR23353_00_0097511E77CE88994CF19550A852B90E8F50D9E355/A775E6853ECBAFA6200FA8FE819C9C53E9CAA8A5.PNG", type: "bronze", earned: true)])
}
