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
        colors: [Color.green,Color.mint],
        startPoint: .top, endPoint: .bottomTrailing)
    
    var body: some View {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                
                    VStack(alignment: .leading) {
                        Text("Sign In")
                            .foregroundStyle(Color.coDarkBlue)
                            .font(.system(size: 30, weight: .heavy))
                            .italic()
                            .padding()
                        
                    Section{
                        if currentUser == "" && !dismissFields {
                            TextField("\tEmail", text: $tempEmail)
                                .frame(height: 55)
                                .background(.dirtyWhite)
                                .cornerRadius(8)
                            
                            SecureField("\tPassword", text: $tempPass)
                                .frame(height:55)
                                .background(.dirtyWhite)
                                .cornerRadius(8)
                        }
                        else {
                            Text("Signed in: \(playerVM.currentPlayer.getName())")
                                .foregroundColor(.coYellow)

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
                                .frame(maxWidth: 300, alignment: .center)
                            
                        })
                        .buttonStyle(.bordered)
                        .background(.dirtyWhite)
                        .foregroundColor(.coYellow)
                        .cornerRadius(12)
                        .padding(.horizontal)

                            
                            //Create new user
                            NavigationLink {
                                RegisterView(playerVM: playerVM, tempEmail: $tempEmail, tempPass: $tempPass)
                            } label: {
                                Text("Reigster")
                                    .frame(maxWidth: 300, alignment: .center)
                            }
                            .buttonStyle(.bordered)
                            .background(.dirtyWhite)
                            .foregroundColor(.coYellow)
                            .cornerRadius(12)
                        }
                        
                        if dismissFields == true{
                            //Sign out user
                            Button(action: {
                                playerVM.signOut()
                                dismissFields = false
                                currentUser = ""
                                
                                
                            }, label: {
                                Text("Sign Out")
                                    .frame(maxWidth: 300, alignment: .center)
                            })
                            .buttonStyle(.bordered)
                            .background(.dirtyWhite)
                            .foregroundColor(.coYellow)

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
