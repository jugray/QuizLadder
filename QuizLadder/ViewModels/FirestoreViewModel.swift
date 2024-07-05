    //
    //  LeaderboardViewModel.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 7/5/24.
    //

import Foundation
import FirebaseCore
import FirebaseFirestore

class FirestoreViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published private var leaders = [LeaderModel]()
    
    func getLeaders() -> [LeaderModel]{
        return self.leaders 
    }
    
    func fetchLeaders() async{
        //clear local list fist
        leaders.removeAll()
        
        //get new ones
        do {
            let querySnapshot = try await db.collection("Leaders").getDocuments()
            for document in querySnapshot.documents {
                self.leaders.append(try document.data(as: LeaderModel.self))
                print("\(document.documentID) => \(document.data())")
            }
        } catch {
            print("Error getting documents: \(error)")
        }
        
    }
    
    func addLeader(playerNameIn: String, playerHighScore: Int) async{
            // Add a new document with a generated id.
            do {
              let ref = try await db.collection("Leaders").addDocument(data: [
                "playerName": playerNameIn,
                "highScore": playerHighScore
              ])
              print("Document added with ID: \(ref.documentID)")
            } catch {
              print("Error adding document: \(error)")
            }
    }
    
    func addPlayer(playerNameIn: String, playerID: String) async{
            // Add a new document with a generated id.
            do {
              let ref = try await db.collection("Players").addDocument(data: [
                "playerName": playerNameIn,
                "playerID": playerID
              ])
              print("Document added with ID: \(ref.documentID)")
            } catch {
              print("Error adding document: \(error)")
            }
    }
    
}
