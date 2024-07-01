//
//  QuizViewModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import Foundation

class QuizViewModel : ObservableObject{
    
    @Published private(set) var questionSet = [QuestionData]()
    
    private let url = "https://opentdb.com/api.php?amount=10&type=multiple"
    

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
                                print(results)
                                self.questionSet = results.results
                                self.shuffleOptions()
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
    
    func shuffleOptions(){
        for questions in questionSet.indices {
            questionSet[questions].setQuestions()
        }
    
    }
    
}
