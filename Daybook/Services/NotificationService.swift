//
//  NotificationService.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import Foundation
import UserNotifications
import Combine

@MainActor
final class NotificationService: ObservableObject {
    @Published var isAuthorized: Bool = false
    
    private let center = UNUserNotificationCenter.current()
    
    init () {
        Task {
            await refreshAuthorizationStatus()
            }
        }
    
    func requestAuthorization() async {
        do {
            let granted = try await center.requestAuthorization(options: [.alert, .sound, .badge])
            isAuthorized = granted
        } catch {
            print("Notification auth error:", error)
        }
    }
    
    func refreshAuthorizationStatus() async {
        let settings = await center.notificationSettings()
        isAuthorized = settings.authorizationStatus == .authorized
    }
    
    /// Schedules a simple daily notification at the given hour/minute.
    func scheduleDailyReminder (hour: Int, minute: Int) async {
        guard isAuthorized else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "Time to journal"
        content.body = "Write your note for today in Daybook."
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: "daily_journal_reminder",
            content: content,
            trigger: trigger
        )
        
        do {
            // remove any existing reminder with same id, then add
            center.removePendingNotificationRequests(withIdentifiers: ["daily_journal_reminder"])
            try await center.add(request)
        } catch {
            print("Failed to schedule notification", error)
        }
    }
    
    func cancelDailyReminder() {
        center.removePendingNotificationRequests(withIdentifiers: ["daily_journal_reminder"])
    }
}


