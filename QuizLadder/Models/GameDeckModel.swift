//
//  GameDeckModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/2/24.
//

import Foundation

struct GameDeckModel{
    var loadedQuestions: [QuestionData] = []
    var passedQuestions: [QuestionData] = []
    var currentCard = 0
    var score = 0
    var gameOver = false
    
    
    mutating func setLoadedQuestions(questionsIn: [QuestionData]){
        self.loadedQuestions = questionsIn
        shuffleOptions()
        print("\n\nLoaded Questions:")
        print("\(self.loadedQuestions)")
    }
    
     func getLoadedQuestions() -> [QuestionData]{
        return self.loadedQuestions
    }
    
    mutating func shuffleOptions(){
        for questions in loadedQuestions.indices {
            loadedQuestions[questions].setQuestions()
        }
    }
    
    
    func getCurrentCard() -> QuestionData{
        return loadedQuestions[currentCard]
    }
    
    mutating func scoreQuestion(questionIn: QuestionData, playerAnswer: String) {
        
        var correct = false
        
        print("\n\nScoring Question...")
        print("Player answer: \(playerAnswer)")
        print("Correct answer: \(questionIn.correct_answer)")
        
        
        if (playerAnswer == questionIn.correct_answer){
            correct = true
        }
        else {
            self.gameOver = true
            print("\n\n *** GAME OVER *** \nwomp womp...")
            //PlayerModel.shared.setLastScore(scoreIn: score)
            //print("\nPlayer score: \(PlayerModel.shared.getLastScore())")
            //print("\nPlayer's highscore: \(PlayerModel.shared.getHighScore())")
        }
        
        if (correct){
            switch questionIn.difficulty {
                case "easy":
                    score += 2
                case "medium":
                    score += 3
                case "hard":
                    score += 5
                default:
                    score += 0
            }
            
            print("Answer Correct \(correct)")
            print("Player score is now \(score)")
    
            var newQuestion = QuestionData(question: questionIn.question, difficulty: questionIn.difficulty, correct_answer: questionIn.correct_answer, incorrect_answers: [questionIn.correct_answer])
            
            self.passedQuestions.append(newQuestion)
            print("\nAdding passed question to deck.")
            self.currentCard += 1
        }
     
    }
    
    
}
