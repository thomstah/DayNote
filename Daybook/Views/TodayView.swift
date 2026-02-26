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
    private let promptService = PromptService()
    
    var body: some View {
        VStack(spacing: 16) {
            if let note = todayNote {
                
                if let title = note.title, !title.isEmpty {
                    Text(title)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if note.text.isEmpty {
                    //shows prompt when there is a DayNote but no text yet
                    Text(promptService.promptForToday())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    Text(note.text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .cornerRadius(8)
                }
                
                
            } else {
                Text("No note for today yet.")
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            todayNote = notesStore.noteForToday()
        }
        .navigationTitle("Today")
        .toolbar {
            if let note = todayNote {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        WriteNoteView(
                            title: note.title ?? "", text: note.text
                        ) { newTitle, newText in
                            var updated = note
                            updated.title = newTitle.isEmpty ? nil : newTitle
                            updated.text = newText
                            todayNote = updated
                            notesStore.update(note: updated)
                        }
                    } label: {
                        Text(note.text.isEmpty
                             ? "Write"
                             : "Edit")
                    }
                }
            }
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

        return NavigationStack {
            TodayView()
                .environmentObject(store)
        }
    }

