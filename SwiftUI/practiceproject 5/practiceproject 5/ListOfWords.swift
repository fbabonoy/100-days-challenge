//
//  Adding to a list of words.swift
//  practiceproject 5
//
//  Created by fernando babonoyaba on 7/1/23.
//

import SwiftUI

struct ListOfWords: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)

                }

                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)

        }
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come

        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
}

struct Adding_to_a_list_of_words_Previews: PreviewProvider {
    static var previews: some View {
        ListOfWords()
    }
}
