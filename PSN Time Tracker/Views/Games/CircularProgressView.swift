//
//  CircularProgressView.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: CGFloat
    var body: some View {
        ZStack {
            Circle().stroke(lineWidth: 20).opacity(0.3).foregroundColor(.gray)
            Circle().trim(from: 0, to: CGFloat(min(self.progress, 1))).stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round)).foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270))
            Text(String(format: "%.0f %%", min(self.progress, 1) * 100)).font(.largeTitle).bold()
        }.frame(width: 150, height: 150)
    }
}

#Preview {
    CircularProgressView(progress: 0.75)
}
