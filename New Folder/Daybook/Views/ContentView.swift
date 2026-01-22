//
//  ContentView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem{
                    Label("Today", systemImage: "sun.max")
                }
            
            PastNotesView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
