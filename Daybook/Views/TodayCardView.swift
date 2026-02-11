//
//  TodayCardView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 2/10/26.
//

import SwiftUI

struct TodayCardView: View {
    @EnvironmentObject var notesStore: NotesStore
    @Binding var selectedTab: AppTab
    
    @State private var todayNote: DayNote?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today")
                .font(.headline)
            
            if let note = todayNote {
                if let title = note.title, !title.isEmpty {
                    Text(title)
                        .font(.subheadline)
                        .bold()
                        .lineLimit(1)
                }
                
                Text(note.text.isEmpty ? "No note yet. Start today's entry." : note.text)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            } else {
                Text("No note yet. Start today's entry.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
            
            Button {
                selectedTab = .today
            } label: {
                Text("View Today's Note")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial)
        .cornerRadius(16)
        .onAppear {
            todayNote = notesStore.noteForToday()
        }
    }
}

#Preview {
    let store = NotesStore()
    let cal = Calendar.current
    store.notes.append(
        DayNote(
            date: Date(),
            title: "Preview title",
            text: "Preview of today’s note shown in the widget on Home."
        )
    )

    return TodayCardView(selectedTab: .constant(.home))
        .environmentObject(store)
        .padding()
}
