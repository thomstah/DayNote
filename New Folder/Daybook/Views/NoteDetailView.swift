//
//  NoteDetailView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/19/26.
//

import SwiftUI

struct NoteDetailView: View {
    let note: DayNote
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    } ()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(dateFormatter.string(from: note.date))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                if let title = note.title, !title.isEmpty {
                    Text(title)
                        .font(.title2)
                        .bold()
                }
                
                Text(note.text)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle("Note")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NoteDetailView(
        note: DayNote(
            date: Date(),
            title: "preview title",
            text: "this is a preview of a note so you can see how the detail screen looks"
        )
    )
}
