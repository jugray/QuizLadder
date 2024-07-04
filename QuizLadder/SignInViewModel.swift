//
//  SignInViewModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import Foundation
import FirebaseAuth


class SignInViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var uid = ""
    @Published var signedIn = false;
    
   
    
    func createUser(emailIn: String, passwordIn: String){
        
         let authResult = try Auth.auth().createUser(withEmail: emailIn, password: passwordIn) { authResult, error in
            if let error = error{
                print(error)
            }
            else {
                if let authResult = authResult{
                    print(authResult)
                    self.email = authResult.user.email!
                    self.password = passwordIn
                    //self.uid = authResult.user.uid
                    print("\n*** Firebase Registration ***")
                    print("Email Registered: \(String(describing: authResult.user.email))")
                    print("UserUID: \(authResult.user.uid)")
                }
            }
        }
        print("*** Registration Function Completed ***")
     
    }
    
    func loginUser(emailIn: String, passwordIn: String){
        let authResult = try Auth.auth().signIn(withEmail: emailIn, password: passwordIn) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let error = error{
                print (error)
            }
            else {
                if let authResult = authResult{
                    PlayerModel.shared.setPlayerID(idIn: authResult.user.uid)
                    print("\n*** Firebase SignIn ***")
                    print("Email: \(String(describing: authResult.user.email))")
                    print("UserUID: \(authResult.user.uid)")
                    print("CurrentUID is now: \(PlayerModel.shared.getPlayerID())")
                    self?.signedIn = true;
                    print(self?.signedIn)
                }
            }
        }
    }
}
