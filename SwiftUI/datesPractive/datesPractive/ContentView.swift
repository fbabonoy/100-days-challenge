//
//  ContentView.swift
//  datesPractive
//
//  Created by fernando babonoyaba on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    let tomorrow = Date.now.addingTimeInterval(86400)
    @State private var today = Date.now
    
    var range: ClosedRange<Date> {
        today...tomorrow
    }
    
    var current: DateComponents { Calendar.current.dateComponents([.hour,.minute], from: today)
    }
    
    var body: some View {
        VStack {
            DatePicker("please pick a date", selection: $today, in: today...)
                .labelsHidden()
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
