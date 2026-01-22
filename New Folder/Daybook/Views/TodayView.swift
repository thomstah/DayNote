//
//  TodayView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 1/18/26.
//

import SwiftUI

struct TodayView: View {
    @State private var todayTitle: String = ""
    @State private var todayText: String = ""
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                Text(todayStatusTitle)
                    .font(.title2)
                    .bold()
                
                if !todayTitle.isEmpty {
                    Text(todayTitle)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if !todayText.isEmpty {
                    Text(todayText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.secondary.opacity(0.1))
                        .cornerRadius(8)
                }
                
                NavigationLink {
                    WriteNoteView(title: $todayTitle, text: $todayText)
                } label: {
                    Text(buttonTitle)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Today")
        }
    }
    
    private var todayStatusTitle: String {
        todayText.isEmpty ? "No note yet" : "Today's note"
    }
    
    private var buttonTitle: String {
        todayText.isEmpty ? "Write today's note" : "Edit today's note"
    }
}

#Preview {
    TodayView()
}
