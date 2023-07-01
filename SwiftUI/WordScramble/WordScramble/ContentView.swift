//
//  ContentView.swift
//  WordScramble
//
//  Created by fernando babonoyaba on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        List(people, id: \.self) { name in
            HStack{
                Text("dynamic people \(name)")
                Spacer()
                Button("print name") {
                    print(name)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
