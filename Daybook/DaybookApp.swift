//
//  DaybookApp.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

@main
struct DaybookApp: App {
    @StateObject private var notesStore = NotesStore()
    @StateObject private var notificationService = NotificationService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notesStore)
                .environmentObject(notificationService)
        }
    }
}
