//
//  SignInView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct SignInView: View {
    
    var playerVM : PlayerViewModel
    @State var tempEmail = ""
    @State var tempPass = ""
    @Binding var quickLogin : Bool
    @Binding var currentUser : String
    @State var dismissFields = false
    
    let backgroundGradient = LinearGradient(
        colors: [Color("NeonGreen"),Color("CyberPurple")],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                
                Section{
                    if currentUser == "" && !dismissFields {
                        TextField("Email", text: $tempEmail)
                        SecureField("Password", text: $tempPass)
                    }
                    else {
                        Text("Welcome back \(playerVM.currentPlayer.getEmail())")
                    }
                }
                .padding()
                VStack{
                    //Sign In User
                    Button(action: {
                        print("Attempting signin...")
                        playerVM.loginUser(emailIn: tempEmail, passwordIn: tempPass)
                        
                        dismissFields = true
                        quickLogin = false
   
                    }, label: {
                        Text("Sign In")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    })
                    .buttonStyle(.bordered)
                    
                    //Create new user
                    Button(action: {
                        playerVM.createUser(emailIn: tempEmail, passwordIn: tempPass)
                        
                    }, label: {
                        Text("Register")
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                    .buttonStyle(.bordered)
                
                    if currentUser != ""{
                    //Sign out user
                    Button(action: {
                        playerVM.signOut()
                        dismissFields = false
                        currentUser = ""
                       
                                
                        }, label: {
                            Text("Sign Out")
                            .frame(maxWidth: .infinity, alignment: .center)
                            })
                            .buttonStyle(.bordered)
                        
                    }
                }
                .listRowBackground(Color.clear)
                .padding()
            }
        }
    
    }
}

#Preview {
    struct Preview:View{
        var signInVMPreview = PlayerViewModel()
        @State var currentUserPreview = ""
        @State var quickLogin = false
        @State var currentUser = ""
        
        var body : some View{
            SignInView(playerVM: signInVMPreview, quickLogin: $quickLogin, currentUser: $currentUser)
        }
    }
    return Preview()
}
