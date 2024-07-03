//
//  MenuView.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import SwiftUI

struct MainMenuView: View {

    let backgroundGradient = LinearGradient(
        colors: [Color.mint, Color.red],
        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationView{
        
            ZStack{
                backgroundGradient
                    .ignoresSafeArea()
                VStack{
                    Text(#"QUIZ LADDER"#)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    //Play Game
                    NavigationLink(destination: GameView()){
                        Text("New Game")
                            .padding()
                    }
                    //Check Scores
                    NavigationLink(destination: LeaderboardView()){
                        Text("LeaderBoard")
                            .padding()
                    }
                    
                    //Sign In
                    Text("Sign In")
                        .padding()
                }
            }
            
        }
    }
    
}

#Preview {
    MainMenuView()
}
