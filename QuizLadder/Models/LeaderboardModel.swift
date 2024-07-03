//
//  LeaderboardModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import Foundation

class LeaderboardModel{
    
    var leaderArray = [Leader]()
    
    func addLeaderBoardEntry(leaderIn: Leader){
        self.leaderArray.append(leaderIn)
    }
    
    func getLeaderBoard() -> [Leader] {
        return self.leaderArray
    }
    
}

struct Leader : Identifiable {
    var id : UUID{
        return UUID()
    }
    var name: String
    var Score: Int
    
}

