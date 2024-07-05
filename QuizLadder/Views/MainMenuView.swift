//
//  MenuView.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import SwiftUI

struct MainMenuView: View {

    let backgroundGradient = LinearGradient(
        colors: [Color("NuRed"),Color("NeonYellow"),Color("CoLightBlue"),Color("CoMidBlue"),Color("CoDarkBlue")],
        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @StateObject var playerVM : PlayerViewModel = PlayerViewModel()
    
    
    //Another hack workaround...
    @State var currentUser : String = ""
    @State var quickLogin = true
    
    var body: some View {
        NavigationView{
        
            ZStack{
                backgroundGradient
                    .ignoresSafeArea()
                    
                VStack{
                    Text("QuizLadder")
                        .foregroundStyle(Color.nuRed)
                        .font(.system(size: 60, weight: .heavy ,design: .monospaced))
                        .italic()
                    
                        if currentUser != ""{
                    HStack{
                        Text("Welcome back, \(playerVM.currentPlayer.getEmail())")
                                .padding(.horizontal)
                        
                        Spacer()
                    }
 
                    //Play Game
                    NavigationLink(destination: GameView(playerVM: playerVM)){
                        Text("New Game")
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .foregroundStyle(Color(.dirtyWhite))
                            .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                            .border(Color.coYellow, width: 2)
                            .padding()
                    }
                    
                    //Check Scores
                    NavigationLink(destination: LeaderboardView(playerVM: playerVM)){
                        Text("LeaderBoard")
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            .foregroundStyle(Color(.dirtyWhite))
                            .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                            .border(Color.coYellow, width: 2)
                            .padding()
                    }
                    
                    //Sign In / Sign Out
                    if playerVM.currentPlayer.getloggedIn() == true{
                        NavigationLink(destination: SignInView(playerVM: playerVM, quickLogin: $quickLogin, currentUser: $currentUser)){
                            Text("Sign Out")
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                .foregroundStyle(Color.dirtyWhite)
                                .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                .border(Color.coYellow, width: 2)
                                .padding()
                            }
                        }
                    }
                    else{
                        NavigationLink(destination: SignInView(playerVM: playerVM, quickLogin: $quickLogin, currentUser: $currentUser)){
                            Text("Sign In")
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                .foregroundStyle(Color(.dirtyWhite))
                                .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                .border(Color.coYellow, width: 2)
                                .padding()
                        }
                    }
                }
                .onAppear{
                    print("\n\n*** Quiz Ladder Main Menu ***")
                    print("User Signed In: \(playerVM.currentPlayer.getloggedIn())")
                    print("Current User: \(playerVM.currentPlayer.getName())")
                    print("UserId: \(playerVM.currentPlayer.getPlayerID())")
                    print("UserEmail: \(playerVM.currentPlayer.getEmail())")
                    print("User's Last Score: \(playerVM.currentPlayer.getLastScore())")
                    print("User's High Score: \(playerVM.currentPlayer.getHighScore())")
                    if playerVM.currentPlayer.getPlayerID() != ""{
                        currentUser = playerVM.currentPlayer.getEmail()
                    }
                    
                    
                }
                
            }.sheet(isPresented: $quickLogin, onDismiss: {
                if playerVM.currentPlayer.getPlayerID() != ""{
                    currentUser = playerVM.currentPlayer.getEmail()
                }
                print("Current user now: \(currentUser)")
                print("*** Sign In Dismissed ***")})
                {
                    SignInView(playerVM: PlayerViewModel(), quickLogin: $quickLogin, currentUser: $currentUser)
                        
                    }
            
        }
    }
}

#Preview {
    MainMenuView()
}
