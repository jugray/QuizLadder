    //
    //  RegisterView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 7/6/24.
    //

import SwiftUI

struct RegisterView: View {
    @ObservedObject var playerVM : PlayerViewModel
    @Binding var tempEmail : String
    @Binding var tempPass : String
    @State var tempUserName : String = ""
    @State var dismissFields = false
    
    let backgroundGradient = LinearGradient(
        colors: [Color("CoMidBlue"),Color("CoDarkBlue")],
        startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Register")
                    .foregroundStyle(Color.nuRed)
                    .font(.system(size: 30, weight: .heavy))
                    .italic()
                    .padding()
                
                Section{
                    if dismissFields == false {
                        TextField("\tUserName", text: $tempUserName)
                            .frame(height: 55)
                            .background(.dirtyWhite)
                            .cornerRadius(10)
                        
                        TextField("\tEmail", text: $tempEmail)
                            .frame(height: 55)
                            .background(.dirtyWhite)
                            .cornerRadius(10)
                        
                        SecureField("\tPassword", text: $tempPass)
                            .frame(height:55)
                            .background(.dirtyWhite)
                            .cornerRadius(10)
                    }
                    else {
                        Text("Happy Climbing! \(playerVM.currentPlayer.getEmail())")
                    }
                }
                
                .padding(.horizontal)
                VStack{
                    
                    //Create new user
                    Button(action: {
                        playerVM.createUser(emailIn: tempEmail, passwordIn: tempPass)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            playerVM.setDispalyName(displayNameIn: tempUserName)

                        }
                        
                    }, label: {
                        Text("Register")
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                    .buttonStyle(.bordered)
                    .tint(.dirtyWhite)
                    
                }
                .listRowBackground(Color.clear)
                .padding()
            }
        }
    }
}

#Preview {
    
    struct Preview:View{
        
        var body : some View{
            @State var tempEmailPreview = ""
            @State var tempPassPreview = ""
            
            
            
            RegisterView(playerVM: PlayerViewModel(), tempEmail: $tempEmailPreview, tempPass: $tempPassPreview)
        }
    }
    return Preview()
}
