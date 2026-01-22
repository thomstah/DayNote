//
//  WriteNoteView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

struct WriteNoteView: View {
    @State var title: String
    @State var text: String
    let onSave: (String, String) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField("Title", text: $title)
                .textFieldStyle(.plain)
                .padding(.horizontal)
                .font(.title)
            
            Divider()
            
            TextEditor(text: $text)
                .padding(.horizontal)
                .padding(.bottom)
            
        }
        .navigationTitle("Write Today's Note")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    onSave(title, text)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let sample = DayNote(
        date: Date(),
        title: "Sample title",
        text: "Full text of a sample note for the detail view."
    )
    
    return NavigationStack {
        NoteDetailView(note: sample)
    }
}
