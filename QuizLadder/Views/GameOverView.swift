//
//  GameOver.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct GameOverView: View {
    
    let backgroundGradient = LinearGradient(
        colors: [Color.coRed,Color.nuRed],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    var questionAnswer : String
    var question : String
    var score : Int
    
    var body: some View {
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                Text("YOU FELL!")
                    .foregroundStyle(Color.neonYellow)
                    .font(.system(size: 60, weight: .heavy))
                    .italic()
                    .padding()
                
                
                Text("Player Score: \(score)")
                    .foregroundStyle(Color.dirtyWhite)
                    .font(.system(size:30))
                    .padding()
                
                
                Section{
                    //LMGTFY
                    Text("Would you like to know more?")
                        .italic()
                        .padding()
                    HStack{
                        Text("Tap Here -> ")
                            .foregroundStyle(Color.dirtyWhite)
                            .italic()
                        Link(questionAnswer, destination: URL(string: "https://www.google.com/search?q=" + question)!)
                            .font(.system(size: 24))
                            .buttonStyle(BorderlessButtonStyle())
                            .foregroundColor(.neonYellow)

                    }
                    .font(.system(size:20))
                }
            }
        }
    }
}

#Preview {
    GameOverView(questionAnswer: "Question Answer", question: "Qestion Text", score: 0)
}
