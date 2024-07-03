//
//  CompletedQuizQuestionView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct CompletedQuizQuestionView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color.yellow, Color.orange],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    let questionText : String
    let questionAnswer : String
    
    var body: some View {
        
        ZStack{
            backgroundGradient
                .ignoresSafeArea()  
            VStack{
                VStack{
                    Text(questionText)
                }
                .padding()
                VStack{
                    Text(questionAnswer)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
            }}
    }
}

#Preview {
    CompletedQuizQuestionView(questionText: "Question Text", questionAnswer: "Answer")
}
