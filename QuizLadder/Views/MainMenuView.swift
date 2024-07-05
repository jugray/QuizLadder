//
//  MenuView.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import SwiftUI

struct MainMenuView: View {

    let backgroundGradient = LinearGradient(
        colors: [Color("CyberPurple"),Color("SuperPink")],
        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State var playerVM : PlayerViewModel = PlayerViewModel()
    
    var body: some View {
        NavigationView{
        
            ZStack{
                backgroundGradient
                    .ignoresSafeArea()
                    
                VStack{
                    Text("QuizLadder")
                        .foregroundStyle(Color("Cyan"))
                        .font(.system(size: 60, weight: .heavy ,design: .monospaced))
                        .italic()
                    
                        
                    //Play Game
                    NavigationLink(destination: GameView(playerVM: playerVM)){
                        Text("New Game")
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .foregroundStyle(Color("NeonYellow"))
                            .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                            .border(Color("NuRed"), width: 2)
                            .padding()
                    }
                    
                    //Check Scores
                    NavigationLink(destination: LeaderboardView(playerVM: playerVM)){
                        Text("LeaderBoard")
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .foregroundStyle(Color("NeonYellow"))
                            .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                            .border(Color("NuRed"), width: 2)
                            .padding()
                    }
                    
                    //Sign In / Sign Out
                    if playerVM.currentPlayer.getloggedIn() == true{
                        NavigationLink(destination: SignInView(playerVM: $playerVM)){
                            Text("Sign Out")
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                .foregroundStyle(Color("NeonYellow"))
                                .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                .border(Color("NuRed"), width: 2)
                                .padding()
                            
                        }
                    }
                    else{
                        NavigationLink(destination: SignInView(playerVM: $playerVM)){
                            Text("Sign In")
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                .foregroundStyle(Color("NeonYellow"))
                                .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                .border(Color("NuRed"), width: 2)
                                .padding()
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    MainMenuView()
}
