//
//  QuizViewModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import Foundation

class QuizViewModel : ObservableObject{

    //@Published private(set) var questionSet = [QuestionData]()
    @Published var gameDeck : GameDeckModel = GameDeckModel()
    
    
    /*API URL
     
     More Info: https://opentdb.com/api_config.php
     amount = numer of questions per request
     
    */
    
    private let url = "https://opentdb.com/api.php?amount=50&category=9&type=multiple"
    
    //Get new deck and reset game conditions, lets play!
    func newGame(){
        self.gameDeck.newGameDeck()
        Task {
            await self.getQuestions()
        }
        print("*** New game called ***")
    }
    
    //Player is good, we need more questions!
    func loadMoar(){
        /*Shuffle does not appear to work correctly on new additions?
         Unlikley to make this far with 50 questions, but it should be looked into.
         
         Can also use to ramp the difficulty...
         */
        Task {
            await self.getQuestions()
        }
        print("Loading additional questions")
    }
    
    //Hit the API for questions.
    @MainActor
    func getQuestions() async{
        if let url = URL(string:self.url) {
            do{
                let (data,_) = try await URLSession.shared.data(from: url)
                let results = try JSONDecoder().decode(QuestionList.self, from:data)
                self.gameDeck.setLoadedQuestions(questionsIn: results.results.shuffled())
                print("Added \(results.results.count) questions")

            }
            catch {
                print(error)
            }
        }
    }
    
    
}
