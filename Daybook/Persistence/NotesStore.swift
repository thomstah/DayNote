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
    func noteForToday() -> DayNote? {
        notes.first { calendar.isDateInToday($0.date) }
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
    
    // MARK: - Streaks
    
    func hasNote(on date: Date) -> Bool {
        notes.contains { calendar.isDate($0.date, inSameDayAs: date) }
    }
    
    func currentStreak() -> Int {
        var streak = 0
        var day = Date()
        
        while hasNote(on: day) {
            streak += 1
            guard let previous = calendar.date(byAdding: .day, value: -1, to: day)
            else {
                break
            }
            day = previous
        }
        return streak
    }
    
    func longestStreak() -> Int {
        let uniqueDays = Set(
            notes.map { calendar.startOfDay(for: $0.date) }
        ).sorted()
        
        guard !uniqueDays.isEmpty else { return 0 }
        
        var longest = 1
        var current = 1
        
        for i in 1..<uniqueDays.count {
            let prev = uniqueDays[i - 1]
            let currentDay = uniqueDays[i]
            
            if let expectedNext = calendar.date(byAdding: .day, value: 1, to: prev),
               calendar.isDate(expectedNext, inSameDayAs: currentDay) {
                current += 1
                longest = max(longest, current)
            } else {
                current = 1
            }
        }
        
        return longest
    }
    
    // MARK: - Grid helpers
    
    func recentDays(count: Int) -> [Date] {
        guard count > 0 else { return [] }
        var days: [Date] = []
        var day = calendar.startOfDay(for: Date())
        
        for _ in 0..<count {
            days.append(day)
            if let previous = calendar.date(byAdding: .day, value: -1, to: day) {
                day = previous
            }
        }
        return days.reversed()
    }
    
    func hasNote(onExact day: Date) -> Bool {
        notes.contains { calendar.isDate($0.date, inSameDayAs: day) }
    }
    
    
    
}

