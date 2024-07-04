//
//  SignInView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var playerVM : PlayerViewModel
    @State var tempEmail = ""
    @State var tempPass = ""
    
    let backgroundGradient = LinearGradient(
        colors: [Color("NeonGreen"),Color("CyberPurple")],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
        
                Section{
                    TextField("Email", text: $tempEmail)
                    SecureField("Password", text: $tempPass)
                }

                .padding()
                
                VStack{
                    //Create new user
                    Button(action: {
                        playerVM.loginUser(emailIn: tempEmail, passwordIn: tempPass)
                    }, label: {
                        Text("Sign In")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    })
                    .buttonStyle(.bordered)
                    
                    //Sign in existing user
                    Button(action: {
                        playerVM.createUser(emailIn: tempEmail, passwordIn: tempPass)
                    }, label: {
                        Text("Register")
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                    .buttonStyle(.bordered)
                    Spacer()
                }
                .listRowBackground(Color.clear)
                .padding()
            }
        }
    
    }
}

#Preview {
    struct Preview:View{
        @State var signInVMPreview = PlayerViewModel()
        
        var body : some View{
            SignInView(playerVM: $signInVMPreview)
        }
    }
    return Preview()
}
