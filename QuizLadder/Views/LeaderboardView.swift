    //
    //  LeaderboardView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 7/3/24.
    //

import SwiftUI

struct LeaderboardView: View {
    
    @StateObject var fireStoreVM :FirestoreViewModel = FirestoreViewModel()
    
    let backgroundGradient = LinearGradient(
        colors: [Color("NuRed"),Color("NeonYellow"),Color("CoLightBlue"),Color("CoMidBlue"),Color("CoDarkBlue")],
        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        
        ZStack{
            backgroundGradient.ignoresSafeArea()
            
            VStack {
                Text("Top Rungs")
                    .foregroundStyle(Color.nuRed)
                    .font(.system(size: 40, weight: .heavy))
                    .italic()
                List{
                    ForEach(fireStoreVM.getLeaders()) { leader in
                        HStack{
                            Text("\(leader.getPlayerName())")
                                .font(.system(size: 20))
                            Spacer()
                            Text("\(leader.getHighScore())pts")
                                .font(.system(size: 20, weight: .heavy))
                        }
                        .foregroundColor(.dirtyWhite)
                        .listRowBackground(Color.coYellow)
                        .onAppear(){
                            print("\nPosting ID: \n\(String(describing: leader.id))")
                            print("Name: \(leader.getPlayerName())")
                            print("Score: \(leader.getHighScore())")
                        }
                    }
                }
                
                .opacity(0.8)
                .padding()
            }
            .offset(y:100)
            .onAppear{
                print ("*** Loading Leaderboard *** ")
                Task {
                    await fireStoreVM.fetchLeaders()
                }
                print ("FirebaseDB connected, adding DB data:")
                
            }
            .scrollContentBackground(.hidden)
        }
        
    }
}

#Preview {
    LeaderboardView()
}
