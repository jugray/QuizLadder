    //
    //  ContentView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 6/30/24.
    //

import SwiftUI

struct QuizQuestionView: View {
    
    var qData : QuestionData
    var question : QuestionModel {
        get{
            return QuestionModel(dataIn: qData)
        }
    }
    
    var body: some View {
        VStack{
            VStack {
                Image(systemName: "doc.questionmark.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                Text(qData.question)
            }
            .padding()
            VStack {
                ForEach(qData.incorrect_answers.indices) { answer in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text(qData.incorrect_answers[answer])
                    })
                    
                }
                
            }
        }
    }
    
}

#Preview {
        //QuizQuestionView()
    QuizQuestionView(qData: QuestionData(question: "Question Text", correct_answer: "Question Answer", incorrect_answers: []))
}