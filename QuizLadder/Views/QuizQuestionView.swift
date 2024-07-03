 //
 //  ContentView.swift
 //  QuizLadder
 //
 //  Created by Justin Gray on 6/30/24.
 //

import SwiftUI

struct QuizQuestionView: View {
    
    var qData : QuestionData
    @Binding var scoredDeck : ScoredCards

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
                        scoredDeck.scoreQuestion(questionIn: qData, playerAnswer: qData.incorrect_answers[answer])
                        scoredDeck.passed(questionIn: qData)
                        
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
    //Create struct to use preview with @State wrapper to fix error
    struct Preview:View {
        @State var previewDeck = ScoredCards()
        
        var body : some View {
            
            QuizQuestionView(qData: QuestionData(
                question: "Question Text",
                difficulty: "Difficulty",
                correct_answer: "Question Answer",
                incorrect_answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"]),
                             scoredDeck: $previewDeck)
        }
    }
    return Preview()
}
