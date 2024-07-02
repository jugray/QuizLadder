//
//  GameDeckModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/1/24.
//

import Foundation

struct GameDeckModel{
    
   
    var passedQuestions: [QuestionData] = []
    var currentQuestion = 0 
    var score = 0;
    var gameOver = false;
    
    mutating func scoreQuestion(difficulty: String, correctAnswer: String, playerAnswer: String) {
        
        var correct = false
        
        if (playerAnswer == correctAnswer){
            correct = true
        }
        else {
            self.gameOver = true
        }
        
        if (correct){
            switch difficulty {
                case "easy":
                    score += 2
                case "medium":
                    score += 3
                case "hard":
                    score += 5
                default:
                    score += 0
            }
        }
        print("\n\nScoring Question...")
        print("Player answer: \(playerAnswer)")
        print("Correct answer: \(correctAnswer)")
        print("Answer Correct \(correct)")
        print("Player score is now \(score)")
    }
    
    mutating func passed(questionIn: QuestionData){
        self.passedQuestions.append(questionIn)
        print("Adding passed question to deck\(questionIn.question)")
    }
}
