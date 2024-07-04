//
//  GameOver.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct GameOverView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color("NeonGreen"),Color.red],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    var questionAnswer : String
    var question : String
    var score : Int
    
    var body: some View {
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                Text("Game OVER!")
                    .padding()
                
                    //LMGTFY
                Text("Player Score: \(score)")
                    .padding()
                Text("Correct Answer: ")
                Link(questionAnswer, destination: URL(string: "https://www.google.com/search?q=" + question)!)
                    .buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}

#Preview {
    GameOverView(questionAnswer: "Question Answer", question: "Qestion Text", score: 0)
}
