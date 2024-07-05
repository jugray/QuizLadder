 //
 //  ContentView.swift
 //  QuizLadder
 //
 //  Created by Justin Gray on 6/30/24.
 //

import SwiftUI

struct QuizQuestionView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color.yellow, Color.orange],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    var qData : QuestionData
    var quizVM : QuizViewModel
    var playerVM : PlayerViewModel
    
    @Binding var gameOver : Bool
    
    //@Binding var scoredDeck : ScoredCards

    var body: some View {
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
        VStack{
            VStack {
                Image(systemName: "doc.questionmark.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                Text(qData.question)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            VStack {
                ForEach(qData.incorrect_answers.indices) { answer in
                    Button(action: {
                        if (quizVM.gameDeck.getLoadedQuestions().count - quizVM.gameDeck.getCUrrentCardIndex() == 2){
                            print("Player is good... getting moar")
                            quizVM.loadMoar()
                        }
                        quizVM.gameDeck.scoreQuestion(questionIn: qData, playerAnswer: qData.incorrect_answers[answer])
                        if quizVM.gameDeck.isGameOver(){
                            playerVM.currentPlayer.setLastScore(scoreIn: quizVM.gameDeck.getGameScore())
                            self.gameOver = true
                        }
                    }, label: {
                        Text(qData.incorrect_answers[answer])
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    })
                    .buttonStyle(.bordered)
                }
    
                }
            }
            .padding()
        }
        .navigationTitle("Quiz!")
    }
    
}

#Preview {
    
    struct Preview:View{
        
        @State var gameOver : Bool = false
        
        var body: some View{
            
                           QuizQuestionView(qData: QuestionData(
                               question: "Question Text",
                               difficulty: "Difficulty",
                               correct_answer: "Question Answer",
                               incorrect_answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"]),
                                            quizVM: QuizViewModel(), playerVM: PlayerViewModel(), gameOver: $gameOver)
        }
    }
    return Preview()
}

