    //
    //  GameView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 6/30/24.
    //

    import SwiftUI

    struct GameView: View {
        
        @ObservedObject var quizVM = QuizViewModel()
        //@ObservedObject var deck : GameDeckModel =  quizVM.gameDeck
        
        //deck object contains passed questions, may just move all "game session" data here
        @State var scoredDeck : ScoredCards  = ScoredCards()
        
        let backgroundGradient = LinearGradient(
            colors: [Color.indigo, Color.mint],
            startPoint: .top, endPoint: .bottom)
        
        
        var body: some View {
            
            ZStack{
                backgroundGradient
                    .ignoresSafeArea()
                List{
                        //Score and current Question
                    Section {
                        HStack{
                            Text("Player Score: ")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Text("\(scoredDeck.score)")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                        }
                        .listRowBackground(Color.clear)
                        
                        
                        //Display progress view if the list is empty
                        if (quizVM.gameDeck.getLoadedQuestions().isEmpty){
                            HStack{
                                Spacer()
                                Text("Loading ")
                                ProgressView()
                                Spacer()
                            }
                            
                        }
                        else {
                            // Normal gameplay, load next card.
                            if (!scoredDeck.gameOver){
                                QuizQuestionView(qData: quizVM.gameDeck.getLoadedQuestions()[scoredDeck.currentQuestion], scoredDeck: $scoredDeck)
                                    .listRowBackground(Color.clear)
                            }
                            
                            // Player has goofed, shut it down
                            else {
                               //Moved to sheet for now, see below.
                            }
                        }
                    }
                        //Loop through completed card stack and display each card
                        ForEach(scoredDeck.passedQuestions.reversed()) { question in
                                //QuizQuestionView(qData: question)
                            CompletedQuizQuestionView(questionText: question.question, questionAnswer: question.correct_answer)
                                .listRowBackground(Color.clear)
                        }
                                    
                }
                .sheet(isPresented:$scoredDeck.gameOver) {
                    GameOverView(questionAnswer: quizVM.gameDeck.getLoadedQuestions()[scoredDeck.currentQuestion].correct_answer ,
                                 question: quizVM.gameDeck.getLoadedQuestions()[scoredDeck.currentQuestion].question, score: scoredDeck.score)
                    
                    }
                .scrollContentBackground(.hidden)
                
                //.listRowSpacing(0)
                .listSectionSpacing(25)
                .refreshable {
                    quizVM.getQuestions()
                }
                .onAppear{
                    quizVM.getQuestions()
                    
                }
            }
        }
    }

    #Preview {
        GameView()
    }
