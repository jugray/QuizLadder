//
//  QuestionModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/1/24.
//

import Foundation

struct QuestionModel{
    var data : QuestionData
    var answerOptions : [String]
    var score : Int
    
    init (dataIn: QuestionData){
        data = dataIn
        score = 0
        answerOptions = []
    }
    
}
