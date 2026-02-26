//
//  PromptCardView.swift
//  Daybook
//
//  Created by Thommy Xaysongkham on 2/25/26.
//

import SwiftUI

struct PromptCardView: View {
    private let promptService = PromptService()
    
    var body: some View {
        let prompt = promptService.promptForToday()
        
        return VStack(alignment: .leading, spacing: 12) {
            Text("Today's prompt")
                .font(.headline)
                        
            Text(prompt)
                .font(.footnote)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer(minLength: 0)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.thinMaterial)
        .cornerRadius(16)
    
    }
}

#Preview {
    PromptCardView()
        .padding()
}
