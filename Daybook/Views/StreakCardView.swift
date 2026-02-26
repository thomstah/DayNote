//
//  StreakCardView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 2/12/26.
//

import SwiftUI

struct StreaksCardView: View {
    @EnvironmentObject var notesStore: NotesStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Streaks")
                .font(.headline)
                                    
            VStack(alignment: .leading, spacing: 4) {
                Text("Current")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(notesStore.currentStreak()) days")
                    .font(.subheadline)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Longest")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(notesStore.longestStreak()) days")
                    .font(.subheadline)
            }
            
            Spacer(minLength: 0)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.thinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    let store = NotesStore()
    // Fake some notes for streaks
    let cal = Calendar.current
    for offset in 0..<15 {
        if let day = cal.date(byAdding: .day, value: -offset, to: Date()) {
            store.notes.append(DayNote(date: day, title: nil, text: "Note \(offset)"))
        }
    }

    return StreaksCardView()
        .environmentObject(store)
        .padding()
}
