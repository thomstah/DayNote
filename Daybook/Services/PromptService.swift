//
//  PromptService.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 2/25/26.
//

import Foundation

struct PromptService {
    private let prompts: [String] = [
        "What is one thing you're grateful for today?",
        "What moment made you smile today?",
        "What challenged you today, and what did you learn?",
        "Describe today in three words.",
        "What is something you're looking forward to?",
        "What is one thing you'd like to do differently tomorrow?",
        "What would you tell yourself at the start of today?",
        "What helped you feel calm today?"
    ]
    
    func promptForToday(date: Date = Date()) -> String {
        guard !prompts.isEmpty else { return "Write anything that's on your mind." }
        
        let calendar = Calendar.current
        let dayNumber = calendar.ordinality(of: .day, in: .year, for: date) ?? 0
        let index = dayNumber % prompts.count
        return prompts[index]
    }
}
