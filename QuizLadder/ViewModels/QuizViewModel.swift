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
    //private let url = "https://opentdb.com/api.php?amount=50"
    private let url = "https://opentdb.com/api.php?amount=10&category=9&type=multiple"
    
    //Get new deck and reset game conditions, lets play!
    func newGame(){
        self.gameDeck.newGameDeck()
        self.getQuestions()
        print("*** New game called ***")
    }
    
    //Player is good, we need more questions!
    func loadMoar(){
        /*Shuffle does not appear to work correctly on new additions?
         Unlikley to make this far with 50 questions, but it should be looked into.
         */
        self.getQuestions()
        print("Loading additional questions")
    }
    
    //Hit the API for questions.
    func getQuestions() {
        if let url = URL(string: url){
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error{
                        print (error)
                    }
                    else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(QuestionList.self, from:data)
                                //self.questionSet = results.results
                                self.gameDeck.setLoadedQuestions(questionsIn: results.results)
                                print("Added \(results.results.count) questions")
                                
                                
                            }
                            catch {
                                print(error)
                            }
                        }
                    }
                    
                }
                .resume()
        }
        
    }
    
    
}
