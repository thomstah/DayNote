//
//  DayNote.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import Foundation

struct DayNote: Identifiable, Hashable, Codable {
    let id: UUID
    let date: Date
    var title: String?
    var text: String

    init(
        id: UUID = UUID(),
        date: Date = Date(),
        title: String? = nil,
        text: String
    ) {
        self.id = id
        self.date = date
        self.title = title
        self.text = text
    }
}
