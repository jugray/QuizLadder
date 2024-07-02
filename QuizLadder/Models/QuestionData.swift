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
    
    
}

