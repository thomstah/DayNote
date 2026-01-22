//
//  HistoryView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

struct PastNotesView: View {
    // Temporary sample data; will come from store later
    @State private var sampleNotes: [DayNote] = [
        DayNote(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                text: "Chatchawan is a grown man"),
        DayNote(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
                text: "I want to eat Chili's"),
        DayNote(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                text: "I'm so hungryryryryry")
    ]
    
    private var sortedNotes: [DayNote] {
        sampleNotes.sorted { $0.date > $1.date }
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
                            Text(note.text)
                                .lineLimit(2)
                                .font(.headline)
                            Text(dateFormatter.string(from: note.date))
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Your Notes")
            }
        }
}

#Preview {
    PastNotesView()
}
