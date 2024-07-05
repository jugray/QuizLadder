//
//  PlayerModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import Foundation

class PlayerModel :ObservableObject{
    
    @Published private var playerName : String
    @Published private var playerScore : Int
    @Published private var playerHighScore : Int
    @Published private var leaderboard: LeaderboardModel
    @Published private var playerID : String
    @Published private var email = ""
    @Published private var loggedIn = false;
    
    //Do we only want one...
    //static let shared = PlayerModel()
    
    init(){
        self.playerName = "Default Player"
        self.playerScore = 0
        self.playerHighScore = 0
        self.leaderboard = LeaderboardModel()
        self.playerID = ""
        self.email = ""
        self.loggedIn = false
    }
    
   func getloggedIn() -> Bool{
        return self.loggedIn
    }
    
    func setLoggedIn(boolIn: Bool){
        self.loggedIn = boolIn
        
    }
    
    func setPlayerID(idIn: String){
        self.playerID = idIn
    }
    
    func getPlayerID() -> String {
        return self.playerID
    }
    
    func getName() -> String{
        return self.playerName
    }
    
    func setName(nameIn: String){
        self.playerName = nameIn
        }
    
    func getEmail() -> String{
        return self.email
    }
    
    func setEmail(emailIn: String){
        self.email = emailIn
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
    
    func leaderboardAccess() -> LeaderboardModel{
        return self.leaderboard
    }
    
   
}
