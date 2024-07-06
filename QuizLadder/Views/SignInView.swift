//
//  SignInView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var playerVM : PlayerViewModel
    @State var tempEmail = ""
    @State var tempPass = ""
    @Binding var quickLogin : Bool
    @Binding var currentUser : String
    @State var dismissFields = false
    
    let backgroundGradient = LinearGradient(
        colors: [Color("CoMidBlue"),Color("CoDarkBlue")],
        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                
                    VStack(alignment: .leading) {
                        Text("Sign In")
                            .foregroundStyle(Color.nuRed)
                            .font(.system(size: 30, weight: .heavy))
                            .italic()
                            .padding()
                        
                    Section{
                        if currentUser == "" && !dismissFields {
                            TextField("\tEmail", text: $tempEmail)
                                .frame(height: 55)
                                .background(.dirtyWhite)
                            
                            SecureField("\tPassword", text: $tempPass)
                                .frame(height:55)
                                .background(.dirtyWhite)
                        }
                        else {
                            Text("Signed in: \(playerVM.currentPlayer.getName())")
                        }
                    }
                    
                    .padding(.horizontal)
                    VStack{
                        if dismissFields != true{
                            //Sign In User
                        Button(action: {
                            print("Attempting signin...")
                            playerVM.loginUser(emailIn: tempEmail, passwordIn: tempPass)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                dismissFields = true
                            }
                            
                        }, label: {
                            Text("Sign In")
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                        })
                        .buttonStyle(.bordered)
                        .tint(.dirtyWhite)
                            
                            //Create new user
                            NavigationLink {
                                RegisterView(playerVM: playerVM, tempEmail: $tempEmail, tempPass: $tempPass)
                            } label: {
                                Text("Reigster")
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .buttonStyle(.bordered)
                            .tint(.dirtyWhite)
                        }
                        
                        if dismissFields == true{
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
                            .tint(.dirtyWhite)
                            
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
