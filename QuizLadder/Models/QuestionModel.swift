//
//  QuestionModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/1/24.
//

import Foundation

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
