//
//  BadgesCardView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 2/12/26.
//

import SwiftUI

// PLACEHOLDER WIDGET
struct BadgesCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Badges")
                .font(.headline)
                        
            HStack(spacing: 8) {
                badgeView(title: "3-day", unlocked: true)
                badgeView(title: "7-day", unlocked: false)
                badgeView(title: "First note", unlocked: true)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .background(.thinMaterial)
        .cornerRadius(16)
        
    }
    
    private func badgeView(title: String, unlocked: Bool) -> some View {
        VStack(spacing: 4) {
            Image(systemName: unlocked ? "star.fill" : "star")
                .foregroundColor(unlocked ? .yellow : .gray)
            Text(title)
                .font(.caption2)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    BadgesCardView()
        .padding()
}
