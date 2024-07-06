//
//  CompletedQuizQuestionView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct CompletedQuizQuestionView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color.dirtyWhite, Color.dirtyWhite],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    let questionText : String
    let questionAnswer : String
    
    var body: some View {
        
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
                .opacity(0.8)
            VStack{
                VStack{
                    Text(questionText)
                        .font(.system(size: 24))
                }
                .padding()
                VStack{
                    Text(questionAnswer)
                        .font(.system(size:20))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.red)
                        
                    
                }
                .padding()
            }
        }
        .cornerRadius(20)
    }
}

#Preview {
    CompletedQuizQuestionView(questionText: "Question Text", questionAnswer: "Answer")
}
