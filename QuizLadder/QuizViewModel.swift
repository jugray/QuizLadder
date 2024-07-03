//
//  QuizViewModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import Foundation

class QuizViewModel : ObservableObject{

    @Published private(set) var questionSet = [QuestionData]()
    @Published var gameDeck : GameDeckModel = GameDeckModel()
    
    
    //API URL
    private let url = "https://opentdb.com/api.php?amount=50&type=multiple"
    

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
                                self.questionSet = results.results
                                self.gameDeck.setLoadedQuestions(questionsIn: results.results)
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
