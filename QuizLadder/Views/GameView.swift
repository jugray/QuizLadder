//
//  GameView.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var quizVM = QuizViewModel()
    
    //deck object contains passed questions, may just move all "game session" data here
    @State var deck : GameDeckModel  = GameDeckModel()
      
    
    var body: some View {
        
        List{
            //Get passed questions from list and display
            ForEach(deck.passedQuestions) { question in
                //QuizQuestionView(qData: question)
                QuizQuestionView(qData: question, deck: $deck)
            }
            //Load questions for QuestionList
            ForEach(quizVM.questionSet) { question in
                QuizQuestionView(qData: question, deck: $deck)
            }
    
        }.onAppear{
            
            quizVM.getQuestions()
        }
    }
}

#Preview {
    GameView()
}
