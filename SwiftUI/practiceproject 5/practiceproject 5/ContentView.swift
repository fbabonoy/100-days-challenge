//
//  ContentView.swift
//  practiceproject 5
//
//  Created by fernando babonoyaba on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    private let text = """
        UserDefaults allows you to store simple data types such as Bool, Int, Double, Data, and String on the user's device. This is useful for storing user preferences or settings.
        
        Codable is a protocol that allows you to encode and decode data types such as structs and classes. This is useful for saving and loading data to and from disk.
        """
    @State private var arrayText = [String]()
    
    
    var body: some View {
        
        VStack {
            Text(text)
                .padding(30)
            VStack {
                Button("tap to parse", action: parseData)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Button("trim data", action: trimData)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .font(.custom("Bold", size: 30))
            }
            .padding()
            
     
            VStack {
                List(arrayText, id: \.self) {
                    Text($0)
                }
            }
        }
    }
    
    func parseData() {
        arrayText = text.lowercased().components(separatedBy: " ")
    }
    
    func trimData() {
        arrayText = []
        let answer = text.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come

        arrayText.insert(answer, at: 0)
    
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
