//
//  NotesStore.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/20/26.
//

import Foundation
import Combine

final class NotesStore: ObservableObject {
    @Published var notes: [DayNote] = [] {
        didSet {
            save()
        }
    }
    
    private let calendar = Calendar.current
    private let fileName = "notes.json"
    
    init() {
        load()
    }
    
    // mark: - Public API
    
    // get existing note for today, or create one
    func noteForToday() -> DayNote {
        if let existing = notes.first(where: { calendar.isDateInToday($0.date) }) {
            return existing
        }
        
        let new = DayNote(date: Date(), title: nil, text: "")
        notes.append(new)
        return new
    }
    
    // update an existing note in the array
    func update(note: DayNote) {
        if let index = notes.firstIndex(where: { $0.id == note.id}) {
            notes[index] = note
        } else {
            notes.append(note)
        }
    }
    
    // MARK: - Persistence
    
    private func documentsURL() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    private func fileURL() -> URL? {
        documentsURL()?.appendingPathComponent(fileName)
    }
    
    private func save() {
        guard let url = fileURL() else { return }
        
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: url, options: [.atomic])
        } catch {
            print("Failed to save notes:", error)
        }
        
    }
    
    private func load() {
        guard let url = fileURL(),
              FileManager.default.fileExists(atPath: url.path) else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([DayNote].self, from: data)
            notes = decoded
        } catch {
            print("Failed to load notes:", error)
        }
    }
    
    
}

