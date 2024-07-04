//
//  SignInView.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/3/24.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var signInVM : SignInViewModel
    
    let backgroundGradient = LinearGradient(
        colors: [Color.yellow, Color.orange],
        startPoint: .topTrailing   , endPoint: .bottomLeading)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
        
                Section{
                    TextField("Email", text: $signInVM.email)
                    SecureField("Password", text: $signInVM.password)
                }

                .padding()
                
                VStack{
                    Button(action: {
                        signInVM.loginUser(emailIn: signInVM.email, passwordIn: signInVM.password)
                    }, label: {
                        Text("Sign In")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    })
                    .buttonStyle(.bordered)
                    
                    Button(action: {
                        signInVM.createUser(emailIn: signInVM.email, passwordIn: signInVM.password)
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
        @State var signInVMPreview = SignInViewModel()
        
        var body : some View{
            SignInView(signInVM: $signInVMPreview)
        }
    }
    return Preview()
}
