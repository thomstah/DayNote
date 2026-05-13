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
| ![Home](screenshots/home.png) | ![History](screenshots/history.png) |

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

