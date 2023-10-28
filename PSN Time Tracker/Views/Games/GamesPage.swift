//
//  GamesPage.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct GamesPage: View {
    @EnvironmentObject var gamesData: GamesData
    @EnvironmentObject var profiledata: ProfileData
    @State var loading: Bool = true
    var body: some View {
        ZStack {
            if loading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
                if !gamesData.games.isEmpty {
                    VStack(alignment: .leading) {
                        if !profiledata.profile.avatarUrl.isEmpty {
                            ProfileView(profile: profiledata.profile)
                        }
                        GameList(games: gamesData.games)
                            .animation(.easeIn, value: loading)
                            
                    }
                } else {
                    Text("No games recorded");
                }
            }
            
        }.onAppear {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" {
                Task {
                    await gamesData.fetchGames()
                    await profiledata.fetchProfile()
                    loading = false
                }
            }
        }
    }
}

#Preview {
    GamesPage().environmentObject(GamesData()).environmentObject(ProfileData())
}
