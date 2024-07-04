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
    
    @State var signInVM : SignInViewModel = SignInViewModel()
    
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
                    NavigationLink(destination: GameView()){
                        Text("New Game")
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .foregroundStyle(Color("NeonYellow"))
                            .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                            .border(Color("NuRed"), width: 2)
                            .padding()
                    }
                    
                    //Check Scores
                    NavigationLink(destination: LeaderboardView()){
                        Text("LeaderBoard")
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .foregroundStyle(Color("NeonYellow"))
                            .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                            .border(Color("NuRed"), width: 2)
                            .padding()
                    }
                    
                    //Sign In / Sign Out
                    if signInVM.signedIn == true {
                        NavigationLink(destination: SignInView(signInVM: $signInVM)){
                            Text("Sign Out")
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                .foregroundStyle(Color("NeonYellow"))
                                .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                .border(Color("NuRed"), width: 2)
                                .padding()
                            
                        }
                    }
                    else{
                        NavigationLink(destination: SignInView(signInVM: $signInVM)){
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
