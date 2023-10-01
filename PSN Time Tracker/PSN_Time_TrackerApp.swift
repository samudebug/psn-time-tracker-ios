//
//  PSN_Time_TrackerApp.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

@main
struct PSN_Time_TrackerApp: App {
    @StateObject private var gamesData = GamesData()
    @StateObject private var profileData = ProfileData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gamesData).environmentObject(profileData)
        }
    }
}
