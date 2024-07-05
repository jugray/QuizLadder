//
//  LeaderboardModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import Foundation
import FirebaseFirestoreSwift

struct LeaderModel : Identifiable, Codable {
    @DocumentID var id: String?
    var playerName: String
    var highScore: Int
    
    func getPlayerName() ->String {
        return self.playerName
    }
    
    func getHighScore() -> Int{
        return self.highScore
    }
}

