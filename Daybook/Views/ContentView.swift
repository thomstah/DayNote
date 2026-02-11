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
    case settings
}

struct ContentView: View {
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(AppTab.home)
            
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "sun.max")
                }
                .tag(AppTab.today)
            
            PastNotesView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
                .tag(AppTab.past)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(AppTab.settings)
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
