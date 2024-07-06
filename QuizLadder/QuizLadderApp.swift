//
//  QuizLadderApp.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()

    return true
  }
}


@main
struct QuizLadderApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let backgroundGradient = LinearGradient(
        colors: [Color.green,Color.mint],
        startPoint: .top, endPoint: .bottomTrailing)
    
    var body: some Scene {
        
        WindowGroup {
            MainMenuView()
               
        }
    }
    
}
