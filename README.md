# DayNote

A BeReal-inspired daily journaling iOS app built with SwiftUI. Write one note per day, track your streaks, and look back at your history — submitted to the **Apple Swift Student Challenge**.

---

## Features

- **Daily note** — write one entry per day with a title and free-form text
- **Streak tracking** — current and longest streak displayed on the home screen
- **Daily prompts** — rotating questions to spark reflection
- **History calendar** — browse past entries on a monthly calendar with green dot indicators
- **Core Data persistence** — entries survive app restarts; supports 500+ entries with <100ms save/load

## Stack

| Layer | Technology |
|-------|-----------|
| Language | Swift |
| UI | SwiftUI |
| Persistence | Core Data |
| Settings | UserDefaults |
| Platform | iOS 17+ |

## Screenshots

| Home | History |
|------|---------|
| ![Home](<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-12 at 19 10 12" src="https://github.com/user-attachments/assets/9df0af1c-8c95-4cc7-8628-848497430344" />
) | ![History](<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-12 at 19 10 03" src="https://github.com/user-attachments/assets/b91d5c7f-6965-4c36-9074-4cf7e7e52070" />
) |

## Project Structure

```
Daybook/
├── DaybookApp.swift       # App entry point
├── Models/                # Data models
├── Persistence/           # Core Data stack
├── Services/              # Business logic
├── Views/                 # SwiftUI views
└── Assets.xcassets        # App icons & colors
```

## Getting Started

1. Clone the repo
2. Open `Daybook.xcodeproj` in Xcode 15+
3. Select an iPhone simulator (iOS 17+)
4. Build & run (`⌘R`)

---

Built by [Thommy Xay](https://thommyxay.com)

