    //
    //  GameView.swift
    //  QuizLadder
    //
    //  Created by Justin Gray on 6/30/24.
    //

    import SwiftUI

    struct GameView: View {
        
        @ObservedObject var quizVM = QuizViewModel()
        @ObservedObject var playerVM : PlayerViewModel
        
        //Stupid workaround...fix later
        @State var gameOver = false;
        
        //deck object contains passed questions, may just move all "game session" data here
        //@State var scoredDeck : ScoredCards  = ScoredCards()
        
        let backgroundGradient = LinearGradient(
            colors: [Color.green,Color.mint],
            startPoint: .top, endPoint: .bottomTrailing)
            
        var body: some View {
    
            ZStack{
                backgroundGradient
                    .ignoresSafeArea()

                List{
                    //Score and current Question
                    Section {
                        HStack{
                            Text(playerVM.currentPlayer.getName())
                                .font(.system(size: 24,weight: .medium))
                                .foregroundColor(.neonYellow)
                                .italic()

                            Spacer()
                            Text("Session Best: \(playerVM.currentPlayer.getHighScore())")
                                .font(.system(size: 20,weight: .medium))
                                .foregroundColor(.coMidBlue)
                                .italic()
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        HStack{
                            Text("Score: ")
                                .font(.system(size: 24,weight: .medium))
                                .foregroundColor(.neonYellow)

                            Spacer()
                            Text("\(quizVM.gameDeck.getGameScore())")
                                .font(.system(size: 28,weight: .bold))
                                .foregroundColor(.neonYellow)

                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                        
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
                            if (!quizVM.gameDeck.isGameOver() && quizVM.gameDeck.getCUrrentCardIndex() < quizVM.gameDeck.getLoadedQuestions().count){
                              
                                QuizQuestionView(qData: quizVM.gameDeck.getLoadedQuestions()[quizVM.gameDeck.getCUrrentCardIndex()], quizVM: quizVM, playerVM: playerVM, gameOver: $gameOver)
                                    .listRowBackground(Color.clear)
                                    .onAppear{
                                        print ("\n Displaying card \(quizVM.gameDeck.getCUrrentCardIndex()) of \(quizVM.gameDeck.getLoadedQuestions().count))")
                                    }
                            }
                        }
                    }
                        //Loop through completed card stack and display each card
                        ForEach(quizVM.gameDeck.getPassedQuestions().reversed()) { question in
                                //QuizQuestionView(qData: question)
                            CompletedQuizQuestionView(questionText: question.question, questionAnswer: question.correct_answer)
                                .listRowBackground(Color.clear)
                        }
                        .onAppear{
                            print("Displaying completed cards!")
                            
                            
                        }
                                    
                }
                .sheet(isPresented:$gameOver, onDismiss: {
                    print("*** Ending Game ***")
                    quizVM.newGame()
                }) {
                                    GameOverView(questionAnswer: quizVM.gameDeck.getLoadedQuestions()[quizVM.gameDeck.getCUrrentCardIndex()].correct_answer ,
                                                 question: quizVM.gameDeck.getLoadedQuestions()[quizVM.gameDeck.getCUrrentCardIndex()].question, score: quizVM.gameDeck.getGameScore())
                                    }
                
                .scrollContentBackground(.hidden)
                //.listRowSpacing(0)
                .listSectionSpacing(25)
                .refreshable {
                    quizVM.newGame()
                }
                .onAppear{
                    print("*** Starting new Quiz Game ***")
                    print(quizVM.gameDeck.getPassedQuestions())
                    quizVM.newGame()
                    
                }
            }
        }
    }

    #Preview {
                GameView(playerVM:PlayerViewModel())
    }
