//
//  ContentView.swift
//  project2basics
//
//  Created by fernando babonoyaba on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var correct = 0
    @State private var score = 0
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0, green: 0.25, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.5, green: 0, blue: 0.1), location: 0.5)
            ], center: .top, startRadius: 200, endRadius: 700)
            VStack {
                Spacer()
                Spacer()

                Text("Guess The flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()

                VStack (spacing: 30) {
                    VStack{
                        Text("tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.bold())
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    ForEach(0..<3) { num in
                        Button {
                            flagTapped(num)
                        } label: {
                            Image(countries[num].lowercased())
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 7)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .cornerRadius(20)
                
                Spacer()
                
                Text("Your Score is \(score) out of 8")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Spacer()
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(reset()) {
                resetGame()
                if(score == 8) {
                    correct = 0
                    score = 0
                }
            }
        } message: {
            Text("Your Score is \(score) out of 8")
        }
        .ignoresSafeArea()
    }
    
    func flagTapped(_ num: Int) {
        if correctAnswer == num {
            scoreTitle = "Correct"
            correct += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        score += 1
        showingScore = true
    }
    
    func reset() -> String {
        if score < 8 {
            return "Continue"
        }
        return "Reset"
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
