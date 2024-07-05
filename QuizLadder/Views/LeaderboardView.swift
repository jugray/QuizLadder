    //
    //  LeaderboardView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 7/3/24.
    //

import SwiftUI

struct LeaderboardView: View {
    
    var playerVM : PlayerViewModel
    @ObservedObject var leaderBoardVM = FirestoreViewModel()
    
    let backgroundGradient = LinearGradient(
        colors: [Color("NuRed"),Color("NeonYellow"),Color("CoLightBlue"),Color("CoMidBlue"),Color("CoDarkBlue")],
        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        
        ZStack{
            backgroundGradient.ignoresSafeArea()
            
            VStack {
                Section{
                    Text("Top Climbers")
                        .padding()
                }
                Section{
                    List{
                        ForEach(leaderBoardVM.leaders) { leader in
                            HStack{
                                Text("\(leader.getPlayerName())")
                                Spacer()
                                Text("\(leader.getHighScore())")
                            }
                            .onAppear(){
                                print("\nPosting ID: \n\(String(describing: leader.id))")
                                print("Name: \(leader.getPlayerName())")
                                print("Score: \(leader.getHighScore())")
                            }
                        }
                    }
                }
                .padding()
            }
            .onAppear{
                print ("*** Loading Leaderboard *** ")
                Task {
                    await leaderBoardVM.getLeaders()
                }
                print ("FirebaseDB connected, adding DB data:")
                
            }
            .scrollContentBackground(.hidden)
            
        }
    }
}



#Preview {
    LeaderboardView(playerVM: PlayerViewModel())
}
