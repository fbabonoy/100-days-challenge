//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by fernando babonoyaba on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var setColor = false
    var body: some View {
        Button {
            setColor = !setColor
        } label: {
            Text("this is a button")
                .padding()
                .background(setColor ? .blue : .red)
                .foregroundColor(.white)
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
