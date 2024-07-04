//
//  PlayerModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import Foundation

class PlayerModel :ObservableObject{
    
    private var playerName : String
    private var playerScore : Int
    private var playerHighScore : Int
    private var leaderboard: LeaderboardModel
    @Published private var playerID : String?
    
    
    static let shared = PlayerModel()
    private init(){
        self.playerName = "Default Player"
        self.playerScore = 0
        self.playerHighScore = 0
        self.leaderboard = LeaderboardModel()
        self.playerID = nil
    }
    
   func isSignedIn() -> Bool{
        return self.playerID != nil
    }
    
    func setPlayerID(idIn: String){
        self.playerID = idIn
    }
    
    func getPlayerID() -> String {
        return self.playerID!
    }
    
    func getName() -> String{
        return self.playerName
    }
    
    func setName(nameIn: String){
        self.playerName = nameIn
        }
    
    
    func getLastScore() ->Int{
        return self.playerScore
    }
    
    func getHighScore() ->Int{
        return self.playerHighScore
    }
    
    func setLastScore(scoreIn: Int){
        self.playerScore = scoreIn
        if self.playerScore > self.playerHighScore {
            print("New player high score!")
            print("Updating high score and leaderboard")
            self.playerHighScore =  self.playerScore
            self.leaderboard.addLeaderBoardEntry(leaderIn: Leader(name: self.playerName, Score: self.playerScore))
            print("Current leaderboard: ")
            print(self.leaderboard.getLeaderBoard())
            
        }
    }
    
    func leaderBoardAccess() -> LeaderboardModel{
        return self.leaderboard
    }
    
}
