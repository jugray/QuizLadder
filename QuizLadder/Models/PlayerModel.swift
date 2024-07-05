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
    @Published private var firestoreVM: FirestoreViewModel
    @Published private var playerID : String
    @Published private var email = ""
    @Published private var loggedIn = false;
    
    //Do I want only one?
    //static let shared = PlayerModel()
    
    init(){
        self.playerName = "Default Player"
        self.playerScore = 0
        self.playerHighScore = 0
        self.firestoreVM = FirestoreViewModel()
        self.playerID = ""
        self.email = ""
        self.loggedIn = false
    }
    
    func getFirestoreVM() -> FirestoreViewModel{
        return self.firestoreVM
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
            Task{
                await self.firestoreVM.addLeader(playerNameIn: self.playerName, playerHighScore: self.getHighScore())
            
            print("Current leaderboard: ")
            print( await self.firestoreVM.fetchLeaders())
            }
        }
    }
    /*
    func leaderboardAccess() -> LeaderboardModel{
        return self.leaderboard
    }
     */
    
   
}
