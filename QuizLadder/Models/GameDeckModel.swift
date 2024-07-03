//
//  GameDeckModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/2/24.
//

import Foundation

class GameDeckModel : Observable{
    @Published var loadedQuestions: [QuestionData] = []
    @Published var currentCard = 0
    
    
    func setLoadedQuestions(questionsIn: [QuestionData]){
        self.loadedQuestions = questionsIn
        shuffleOptions()
        print("\n\nLoaded Questions:")
        print("\(self.loadedQuestions)")
    }
    
    func getLoadedQuestions() -> [QuestionData]{
        return self.loadedQuestions
    }
    
    func shuffleOptions(){
        for questions in loadedQuestions.indices {
            loadedQuestions[questions].setQuestions()
        }
    }
    
    
    func getCurrentCard() -> QuestionData{
        return loadedQuestions[currentCard]
    }
    
    
    
    
}
