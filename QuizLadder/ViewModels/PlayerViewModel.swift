//
//  SignInViewModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import Foundation
import FirebaseAuth


class PlayerViewModel: ObservableObject{

    @Published var currentPlayer : PlayerModel = PlayerModel()
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        print("\n*** Signing User Out ***")
        
        self.currentPlayer.setPlayerID(idIn: "")
        self.currentPlayer.setEmail(emailIn: "")
        self.currentPlayer.setLoggedIn(boolIn: false)
        print("CurrentUID is now: \(self.currentPlayer.getPlayerID())")
        print("CurrentEmail is now: \(self.currentPlayer.getEmail())")
        
    }
    
    func createUser(emailIn: String, passwordIn: String){
        
         let authResult = try Auth.auth().createUser(withEmail: emailIn, password: passwordIn) { authResult, error in
            if let error = error{
                print(error)
            }
            else {
                if let authResult = authResult{
                    print(authResult)
                    self.currentPlayer.setEmail(emailIn: authResult.user.email!)
                    //self.uid = authResult.user.uid
                    print("\n*** Firebase Registration ***")
                    print("Email Registered: \(String(describing: authResult.user.email))")
                    print("UserUID: \(authResult.user.uid)")
                }
            }
        }
        print("*** Registration Function Completed ***")
     
    }
    
    
    func setDispalyName(displayNameIn: String){
        print("Attempting to set displayname...")
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = displayNameIn
        changeRequest?.commitChanges { error in
          // ...
        }

    }
    
    func loginUser(emailIn: String, passwordIn: String){
        let authResult = try Auth.auth().signIn(withEmail: emailIn, password: passwordIn) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let error = error{
                print (error)
            }
            else {
                if let authResult = authResult{
                    print("\n*** Firebase SignIn Response ***")
                    print(authResult)
                    self?.currentPlayer.setPlayerID(idIn: authResult.user.uid)
                    self?.currentPlayer.setEmail(emailIn: authResult.user.email ?? "Error")
                    self?.currentPlayer.setLoggedIn(boolIn: true)
                    self?.currentPlayer.setName(nameIn: authResult.user.displayName ?? "Error or not set")
                    print("Email: \(String(describing: authResult.user.email))")
                    print("UserUID: \(authResult.user.uid)")
                    print("DisplayName: \(authResult.user.displayName)")
                    print("\n*** PlayerModel Values Update ***")
                    print("CurrentUID is now: \(self?.currentPlayer.getPlayerID())")
                    print("CurrentEmail is now: \(self?.currentPlayer.getEmail())")
                    print("CurrentName is now: \(self?.currentPlayer.getName())")

                
                }
            }
        }
    }
}
