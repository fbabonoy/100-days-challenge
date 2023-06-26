//
//  ContentView.swift
//  challenge 2
//
//  Created by fernando babonoyaba on 6/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var choises = [ "rock 🤜", "paper ✋", "scissors ✌️"]
    @State private var computerChoise = Int.random(in: 0...2)
    @State private var userChoise = 0
    @State private var total = 0
    @State private var setAlert = false

    var winner: String {
        if userChoise < 5 {
            return "you lose"
        } else if userChoise > 5 {
            return "you win"
        }
        return "is a draw"
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .black, .blue], startPoint: .top, endPoint: .bottom)
            VStack(spacing: 40) {
                Spacer()
                Text("Let's play")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Spacer()

                VStack(spacing: 30) {
                    ForEach(choises, id: \.self) { choise  in
                        Button {
                            compare(choise)
                            gameOver()
                        } label: {
                            Text(choise)
                                .font(.largeTitle)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding()
                                .background(.blue)
                                .cornerRadius(20)
                        }
                        .alert(winner, isPresented: $setAlert) {
                            Button("restart") {
                                userChoise = 0
                                total = 0
                            }
                            
                        }
                    }
                }
                .padding()
                .background(.regularMaterial)
                .cornerRadius(20)

                
                Spacer()
                
                Text("score \(userChoise) of 10")
                    .foregroundColor(total > 0 ? .white : .clear)
                    .font(.title2)
                
                Text("tries \(10 - total)")
                    .foregroundColor(.white)
                    .font(.title2)
                Spacer()

            }
        .padding()
        }
        .ignoresSafeArea()
    }
    
    func compare(_ user:String) {
        let computer = choises[computerChoise]
        if user == "rock" && computer == "scissors" {
            userChoise += 1
        } else if user == "paper" && computer == "rock" {
            userChoise += 1
        } else if user == "scissors" && computer == "paper" {
            userChoise += 1
        } else if user == computer {
            userChoise += 1
        }
        
        computerChoise = Int.random(in: 0...2)
        total += 1
    }
    
    func gameOver() {
        if total > 9 {
            setAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
