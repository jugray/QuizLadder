//
//  GameDeckModel.swift
//  QuizLadder
//
//  Created by Justin Gray on 7/2/24.
//

import Foundation

struct GameDeckModel{
    private var loadedQuestions: [QuestionData] = []
    private var passedQuestions: [QuestionData] = []
    private var currentCardIndex = 0
    private var score = 0
    private var gameOver = false
    
    func getCUrrentCardIndex() -> Int{
        return self.currentCardIndex
    }
    
    mutating func newGameDeck(){
        score = 0;
        currentCardIndex = 0
        gameOver = false;
        passedQuestions.removeAll()
        loadedQuestions.removeAll()
    }
    
 
    func isGameOver() ->Bool {
        return self.gameOver    
    }
    
    mutating func setLoadedQuestions(questionsIn: [QuestionData]){
        self.loadedQuestions.append(contentsOf: questionsIn)
        shuffleOptions()
        print("\n\nLoaded Questions:")
        print("\(self.loadedQuestions)")
    }
    
    
    func getLoadedQuestions() -> [QuestionData]{
        return self.loadedQuestions
    }
    
    func getPassedQuestions() -> [QuestionData]{
        return self.passedQuestions
    }
    
    
    mutating func shuffleOptions(){
        print("Correcting answers for questions > index : \(self.getCUrrentCardIndex())")
        for questions in loadedQuestions.indices {
            if questions >= self.getCUrrentCardIndex(){
                loadedQuestions[questions].setQuestions()
            }
        }
    }
   
    func getGameScore() -> Int{
        return self.score
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
          
        }
        
        if (correct){
            switch questionIn.difficulty {
                case "easy":
                    score += 2
                case "medium":
                    score += 5
                case "hard":
                    score += 8
                default:
                    score += 0
            }
            
            print("Answer Correct \(correct)")
            print("Player score is now \(score)")
    
            var newQuestion = QuestionData(question: questionIn.question, difficulty: questionIn.difficulty, correct_answer: questionIn.correct_answer, incorrect_answers: [questionIn.correct_answer])
            
            self.passedQuestions.append(newQuestion)
            print("\nAdding passed question to deck.")
            self.currentCardIndex += 1
            print("CardIndex: \(self.currentCardIndex)")
            print("Cards remaining in deck: \(self.getLoadedQuestions().count - self.getCUrrentCardIndex())")
        }
     
    }
    
    
}
