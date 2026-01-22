//
//  WriteNoteView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

struct WriteNoteView: View {
    @Binding var title: String
    @Binding var text: String
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
                    dismiss()
                }
            }
        }
    }
}

struct StatefulePreviewWrapper: View {
    @State private var title: String = "Sample title"
    @State private var text: String = "sample body text"
    
    var body: some View {
        NavigationStack {
            WriteNoteView(title: $title, text: $text)
        }
    }
}

#Preview {
    StatefulePreviewWrapper()
}
