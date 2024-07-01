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

