//
//  ProfileData.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation

final class ProfileData: ObservableObject {
    @Published var profile: Profile = Profile(avatarUrl: "")
    
    func fetchProfile() async {
        do {
            let profile: Profile = try await APIHelper().performGet(path: "/get_own_info")
            
            await MainActor.run {
                if profile.avatarUrl.starts(with: "http://") {
                    self.profile = Profile(avatarUrl: profile.avatarUrl.replacingOccurrences(of: "http://", with: "https://"))
                } else {
                    self.profile = profile
                }
                
            }
        } catch {
            fatalError("Failed to fetch profile \(error)")
        }
    }
}
