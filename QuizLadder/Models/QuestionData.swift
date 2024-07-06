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
        var question: String
        let difficulty : String
        var correct_answer: String
        var incorrect_answers : [String]
        
    
    mutating func setQuestions(){
        
        incorrect_answers.append(correct_answer)
        incorrect_answers.shuffle()
        scrubHTML()
        print ("\nPostShuffle: \(incorrect_answers)")
    }
        
    mutating func scrubHTML(){
        //Array of unwanted HTML characters in JSON response.
        let dontLike: [(String, String)] = [("&quot;","\""),("&#039;","\'"),("&amp;", "&")]
        
        for htmlStrings in dontLike{
            self.question = self.question.replacingOccurrences(of: htmlStrings.0, with: htmlStrings.1)
            self.correct_answer = self.correct_answer.replacingOccurrences(of: htmlStrings.0, with: htmlStrings.1)
            for incorrect_answer in incorrect_answers.indices {
                incorrect_answers[incorrect_answer] =
                    self.incorrect_answers[incorrect_answer].replacingOccurrences(of: htmlStrings.0, with: htmlStrings.1)
            }
        }

    }
    
}

