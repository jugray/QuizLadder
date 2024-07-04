    //
    //  GameView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 6/30/24.
    //

    import SwiftUI

    struct GameView: View {
        
        @ObservedObject var quizVM = QuizViewModel()
        @ObservedObject var playerVM:PlayerViewModel
        
        //deck object contains passed questions, may just move all "game session" data here
        //@State var scoredDeck : ScoredCards  = ScoredCards()
        
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
                                .font(.title)
                            Spacer()
                            Text("\(quizVM.gameDeck.score)")
                                .font(.title)
                            
                        }
                        .listRowBackground(Color.clear)
                        
                        
                        //Display progress view if the list is empty
                        if (quizVM.gameDeck.getLoadedQuestions().isEmpty){
                            HStack{
                                Spacer()
                                Text("Loading")
                                ProgressView()
                                Spacer()
                            }
                            
                        }
                        else {
                            // Normal gameplay, load next card.
                            if (!quizVM.gameDeck.gameOver){
                                QuizQuestionView(qData: quizVM.gameDeck.getLoadedQuestions()[quizVM.gameDeck.currentCard], quizVM: quizVM)
                                    .listRowBackground(Color.clear)
                            }
                            
                            // Player has goofed, shut it down
                            else {
                               //Moved to sheet for now, see below.
                            }
                        }
                    }
                        //Loop through completed card stack and display each card
                        ForEach(quizVM.gameDeck.passedQuestions.reversed()) { question in
                                //QuizQuestionView(qData: question)
                            CompletedQuizQuestionView(questionText: question.question, questionAnswer: question.correct_answer)
                                .listRowBackground(Color.clear)
                        }
                        .onAppear{
                            print("Displaying completed cards!")
                        }
                                    
                }
                .sheet(isPresented:$quizVM.gameDeck.gameOver) {
                                    GameOverView(questionAnswer: quizVM.gameDeck.getLoadedQuestions()[quizVM.gameDeck.currentCard].correct_answer ,
                                                 question: quizVM.gameDeck.getLoadedQuestions()[quizVM.gameDeck.currentCard].question, score: quizVM.gameDeck.score)
                                    
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
        struct Preview:View {
            
            @ObservedObject var playerVM:PlayerViewModel = PlayerViewModel()
        
            var body: some View {
                GameView(playerVM:playerVM)
            }
        }
        return Preview()
    }
