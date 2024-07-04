//
//  LeaderboardView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct LeaderboardView: View {

    let backgroundGradient = LinearGradient(
        colors: [Color("NeonGreen"),Color("CyberPurple")],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
    
        ZStack{
            backgroundGradient.ignoresSafeArea()

            VStack {
                List{
                    ForEach(PlayerModel.shared.leaderBoardAccess().getLeaderBoard()){ leader in
                        HStack{
                            Text("\(PlayerModel.shared.getName())")
                            Spacer()
                            Text("\(PlayerModel.shared.getHighScore())")
                        }
                        
                    }
                }
                .scrollContentBackground(.hidden)
                
            }
        }
    }
}

#Preview {
    LeaderboardView()
}
