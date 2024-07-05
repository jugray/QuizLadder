//
//  LeaderboardView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct LeaderboardView: View {
    
    var playerVM : PlayerViewModel

    let backgroundGradient = LinearGradient(
        colors: [Color("NeonGreen"),Color("CyberPurple")],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
    
        ZStack{
            backgroundGradient.ignoresSafeArea()

            VStack {
                List{
                    
                    ForEach(playerVM.currentPlayer.leaderboardAccess().getLeaderBoard()){ leader in
                        if leader.name != ""{
                            HStack{
                                Text("\(playerVM.currentPlayer.getName())")
                                Spacer()
                                Text("\(playerVM.currentPlayer.getHighScore())")
                            }
                        }
                        
                    }
                   
                }
                .scrollContentBackground(.hidden)
               
            }
            .onAppear{
                print ("*** Loading Leaderboard *** ")
                print(playerVM.currentPlayer.leaderboardAccess().getLeaderBoard())
                
            }
            
        }
    }
}

#Preview {
    LeaderboardView(playerVM: PlayerViewModel())
}
