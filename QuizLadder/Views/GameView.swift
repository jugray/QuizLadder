//
//  GameView.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var quizVM = QuizViewModel()
    @State var gameData : GameTracker = GameTracker()
    
    var body: some View {
        List{
         
            ForEach(quizVM.questionSet) { question in
                
                QuizQuestionView(qData: question)
                
            }
            
            
        }.onAppear{
            
            quizVM.getQuestions()
        }
    }
}

#Preview {
    GameView()
}
