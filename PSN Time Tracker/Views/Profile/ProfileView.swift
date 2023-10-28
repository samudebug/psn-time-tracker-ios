//
//  ProfileView.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 28/10/23.
//

import SwiftUI

struct ProfileView: View {
    var profile: Profile
    var body: some View {
        HStack {
            AsyncImage(url: URL( string: profile.avatarUrl)){
                image in image.image?.resizable()
            }.frame(width: 40, height: 40).clipShape(Circle())
            Text(profile.name)
        }.padding()
    }
}

#Preview {
    ProfileView(profile: Profile(avatarUrl: "https://pbs.twimg.com/profile_images/1499871193826054146/RQwHt6hn_400x400.jpg", name: "crisdebug"))
}
