    //
    //  ContentView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 6/30/24.
    //

import SwiftUI

struct QuizQuestionView: View {
    
    var qData : QuestionData
    @State var gameData : GameTracker = GameTracker()
    
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
                    Button(action: {
                        gameData.scoreQuestion(difficulty: qData.difficulty,
                                               correctAnswer: qData.correct_answer,
                                               playerAnswer: qData.incorrect_answers[answer])
                    }, label: {
                        Text(qData.incorrect_answers[answer])
                            .frame(maxWidth: .infinity, alignment: .leading)
        
                    })
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            .padding()
        }
    }
    
}

#Preview {
        //QuizQuestionView()
    QuizQuestionView(qData: QuestionData(question: "Question Text", difficulty: "Difficulty", correct_answer: "Question Answer", incorrect_answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"]))
}
