//
//  HomeView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/25/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var notesStore: NotesStore
    @Binding var selectedTab: AppTab
    
    private let numberofWeeks = 17
    private let daysPerWeek = 7
    
    private var weekColumns: [[Date]] {
        let totalDays = numberofWeeks * daysPerWeek
        let allDays = notesStore.recentDays(count: totalDays)
        
        var columns: [[Date]] = []
        var current: [Date]  = []
        
        for (index, day) in allDays.enumerated() {
            current.append(day)
            if current.count == daysPerWeek || index == allDays.count - 1 {
                columns.append(current)
                current = []
            }
        }
        
        return columns
    }
    
    private let dayFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "MMM d"
        return f
    }()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    TodayCardView(selectedTab: $selectedTab)
                    
                    HStack(spacing: 12) {
                        StreaksCardView()
                        PromptCardView()
                    }
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    
                    //streakWidget
                    
                    gridWidget
                }
                .padding(.horizontal)
            }
            .navigationTitle("Home")
        }
    }
    
    // MARK: - Widgets
    
    private var streakWidget: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Streaks")
                .font(.headline)
            
            HStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Current")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("\(notesStore.currentStreak()) days")
                        .font(.title3)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Longest")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("\(notesStore.longestStreak()) days")
                        .font(.title3)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial)
        .cornerRadius(16)
    }
    
    private var gridWidget: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Daily notes")
                .font(.headline)
            
            HStack(alignment: .top, spacing: 4) {
                ForEach(weekColumns, id: \.self) { column in
                    VStack(spacing: 4) {
                        ForEach(column, id: \.self) { day in
                            let hasNote = notesStore.hasNote(onExact: day)
                            
                            Rectangle()
                                .fill(hasNote ? Color.green : Color.gray.opacity(0.2))
                                .frame(width: 16, height: 16)
                                .cornerRadius(3)
                        }
                    }
                }
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    let store = NotesStore()
    // let cal = Calendar.current

    // Fake: 20 days in a row including today, then some gaps
   /* for offset in 0..<90 {
            if let day = cal.date(byAdding: .day, value: -offset, to: Date()) {
                // Add notes on some days only
                if offset % 2 == 0 || offset % 5 == 0 {
                    store.notes.append(DayNote(date: day, title: nil, text: "Note \(offset)"))
                }
            }
        }
    
    */
    
    store.notes.append(
        DayNote(
            date: Date(),
            title: "preview title",
            text: "Preview of today's note visible in the Today widget."
            )
    )

    return HomeView(selectedTab: .constant(.home))
            .environmentObject(store)
    }
