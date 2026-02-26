//
//  ContentView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

enum AppTab: Hashable {
    case home
    case today
    case past
}

struct ContentView: View {
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView(selectedTab: $selectedTab)
            }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(AppTab.home)
            
            NavigationStack {
                TodayView()
            }
                .tabItem {
                    Label("Today", systemImage: "sun.max")
                }
                .tag(AppTab.today)
            
            NavigationStack {
                PastNotesView()
            }
                .tabItem {
                    Label("History", systemImage: "clock")
                }
                .tag(AppTab.past)
            
        }
    }
}

#Preview {
    let store = NotesStore()
    let notificationService = NotificationService()
    return ContentView()
        .environmentObject(store)
        .environmentObject(notificationService)
}
