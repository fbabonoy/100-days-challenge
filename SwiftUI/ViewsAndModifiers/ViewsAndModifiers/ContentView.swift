//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by fernando babonoyaba on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var setColor = false
    @State private var useLargeFont = true
    var body: some View {
        VStack {
            Button {
                setColor = !setColor
            } label: {
                Text("this is a button")
                    .padding()
                    .background(setColor ? .blue : .red)
                    .foregroundColor(.white)
                    .font(useLargeFont ? .largeTitle : .subheadline)
            }
            Toggle("change font to large", isOn: $useLargeFont)
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
