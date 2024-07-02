//
//  QuizModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 6/30/24.
//

import Foundation

struct QuestionList : Codable{
    let response_code : Int
    let results : [QuestionData]
}

struct GameTracker{
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
    
}

struct QuestionModel{
    let data : QuestionData
    var answerOptions : [String]
    var score : Int
    
    init (dataIn: QuestionData){
        data = dataIn
        score = 0
        answerOptions = []
        setQuestions()
    }
    
    mutating func setQuestions(){
        self.answerOptions.append(contentsOf: data.incorrect_answers)

    }
}

struct QuestionData : Codable, Identifiable{
    var id : UUID{
        return UUID()
    }
    let question: String
    let difficulty : String
    let correct_answer: String
    var incorrect_answers : [String]
    
    
    
    mutating func setQuestions(){

        //answer_options.append(contentsOf: incorrect_answers)
        print("\nSHUFFLEING!")
        print ("\nPreShuffle:  \(incorrect_answers)")
        incorrect_answers.append(correct_answer)
        incorrect_answers.shuffle()
        print ("\nPostShuffle: \(incorrect_answers)")

    }
    
    func getMutatedString() -> NSAttributedString{
       return NSAttributedString(string: question)
    }
    
    
}

