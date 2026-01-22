//
//  TodayView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var notesStore: NotesStore
    @State private var todayNote: DayNote?
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                if let note = todayNote {
                    Text(note.text.isEmpty ? "No note yet" : "Today's note")
                        .font(.title2)
                        .bold()
                    
                    if let title = note.title, !title.isEmpty {
                        Text(title)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if !note.text.isEmpty {
                        Text(note.text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .cornerRadius(8)
                    }
                    
                    NavigationLink {
                        WriteNoteView(
                            title: note.title ?? "",
                            text: note.text
                        ) { newTitle, newText in
                            var updated = note
                            updated.title = newTitle.isEmpty ? nil : newTitle
                            updated.text = newText
                            todayNote = updated
                            notesStore.update(note: updated)
                        }
                    } label: {
                        Text(note.text.isEmpty ? "Write today's note" : "Edit today's note")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
            .padding()
            .onAppear {
                todayNote = notesStore.noteForToday()
            }
            .navigationTitle("Today")
            
        }
    }
}

#Preview {
    let store = NotesStore()
    store.notes = [
        DayNote(
            date: Date(),
            title: "Preview title",
            text: "Preview text for today’s note."
        )
    ]

    return TodayView()
        .environmentObject(store)
}
