//
//  CompletedQuizQuestionView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct CompletedQuizQuestionView: View {
    
    let questionText : String
    let questionAnswer : String
    
    var body: some View {

        VStack{
            Text(questionText)
        }
            .padding()
        VStack{
            Text(questionAnswer)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding()
    }
    
}

#Preview {
    CompletedQuizQuestionView(questionText: "Question Text", questionAnswer: "Answer")
}
