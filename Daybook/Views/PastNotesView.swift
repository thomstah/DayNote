//
//  HistoryView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

struct PastNotesView: View {
    @EnvironmentObject var notesStore: NotesStore
    
    private var sortedNotes: [DayNote] {
        notesStore.notes.sorted { $0.date > $1.date }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            List(sortedNotes) { note in
                NavigationLink {
                    NoteDetailView(note: note)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        // Title (only if non-empty)
                        if let title = note.title?
                            .trimmingCharacters(in: .whitespacesAndNewlines),
                           !title.isEmpty {
                            Text(title)
                                .font(.headline)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        
                        Text(previewText(for: note))
                            .lineLimit(1)
                            .font(.subheadline)
                            .truncationMode(.tail)
                            .foregroundColor(.secondary)
                        
                        Text(dateFormatter.string(from: note.date))
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Your Notes")
        }
    }
    
    private func previewText(for note: DayNote) -> String {
        let trimmedText = note.text.trimmingCharacters(in: .whitespacesAndNewlines)
        let maxChars = 80
        if trimmedText.count > maxChars {
            let idx = trimmedText.index(trimmedText.startIndex, offsetBy: maxChars)
            return String(trimmedText[..<idx])
        } else {
            return trimmedText
        }
    }
}
    

#Preview {
    let store = NotesStore()
    store.notes = [
        DayNote(date: Date(), title: "Today", text: "Today's Note"),
                DayNote(
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                    title: "Yester",
                    text: "Yesterday's note that is long enough to demonstrate truncation in the preview list."
                ),
                DayNote(
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
                    title: nil,
                    text: "This is a note without a title so the text itself will be used as the single-line preview."
                )
    ]
    
    return PastNotesView()
        .environmentObject(store)
}
