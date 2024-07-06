//
//  MenuView.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import SwiftUI

struct MainMenuView: View {

    let backgroundGradient = LinearGradient(
        colors: [Color.green,Color.mint],
        startPoint: .top, endPoint: .bottomTrailing)
    
    @StateObject var playerVM : PlayerViewModel = PlayerViewModel()
    
    
    //Another hack workaround...
    @State var currentUser : String = ""
    @State var loading = true
    
    var body: some View {
        NavigationView{
            ZStack{
                backgroundGradient
                    .ignoresSafeArea()
                    
                VStack{
                    Text("QuizLadder")
                        .foregroundStyle(Color.coDarkBlue)
                        .font(.system(size: 60, weight: .heavy ,design: .monospaced))
                        .italic()
                    
                    if loading == false {
                        if currentUser != ""{
                            HStack{
                                Text("Watch your step, \(playerVM.currentPlayer.getName())!")
                                    .foregroundColor(.neonYellow)
                                    .font(.system(size: 18))
                                    .padding(.horizontal)
                                    .italic()
                                
                                Spacer()
                            }
                            
                                //Play Game
                            NavigationLink(destination: GameView(playerVM: playerVM)){
                                Text("New Game")
                                    .frame(maxWidth: 300, maxHeight: 50, alignment: .center)
                                    .foregroundStyle(Color(.coYellow))
                                    .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                    .background(Color.dirtyWhite)
                                    .cornerRadius(12)
                                    .padding()
                            }
                            
                                //Check Scores
                            NavigationLink(destination: LeaderboardView()){
                                Text("LeaderBoard")
                                    .frame(maxWidth: 300, maxHeight: 50, alignment: .center)
                                    .foregroundStyle(Color(.coYellow))
                                    .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                    .background(Color.dirtyWhite)
                                    .cornerRadius(12)
                                    .padding()
                            }
                            
                                //Sign In / Sign Out
                            if playerVM.currentPlayer.getloggedIn() == true{
                                NavigationLink(destination: SignInView(playerVM: playerVM,  currentUser: $currentUser)){
                                    Text("Sign Out")
                                        .frame(maxWidth: 300, maxHeight: 50, alignment: .center)
                                        .foregroundStyle(Color(.coYellow))
                                        .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                        .background(Color.dirtyWhite)
                                        .cornerRadius(12)
                                        .padding()
                                }
                            }
                        }
                        else{
                            NavigationLink(destination: SignInView(playerVM: playerVM, currentUser: $currentUser)){
                                Text("Sign In")
                                    .frame(maxWidth: 300, maxHeight: 50, alignment: .center)
                                    .foregroundStyle(Color(.coYellow))
                                    .font(.system(size: 20, weight: .heavy ,design: .monospaced))
                                    .background(Color.dirtyWhite)
                                    .cornerRadius(12)
                                    .padding()
                            }
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()+1){
                        withAnimation{
                            loading = false
                        }
                    }
                    
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
               //Quick login seems buggy. Revisit if we refactor to enviornment object?
            }/*.sheet(isPresented: $quickLogin, onDismiss: {
                if playerVM.currentPlayer.getPlayerID() != ""{
                    currentUser = playerVM.currentPlayer.getEmail()
                }
                print("Current user now: \(currentUser)")
                print("*** Sign In Dismissed ***")})
                {
                    SignInView(playerVM: PlayerViewModel(), quickLogin: $quickLogin, currentUser: $currentUser)
                        
                    }
              */
            
        }.tint(.coDarkBlue)
             
    }
}

#Preview {
    MainMenuView()
}
