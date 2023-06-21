//
//  ContentView.swift
//  WeSplit
//
//  Created by fernando babonoyaba on 6/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var ammount = 0.0
    @State private var people = 2
    @State private var percent = 20
    
    enum Field: Hashable {
            case myField
        }
    
    @FocusState private var focusedField: Field?

    var total: Double {
        let ammpuntPerPerson = (ammount/Double(people+2))
        let tip = ammpuntPerPerson * (Double(percent)/100)
        return ammpuntPerPerson + tip
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("thud", value: $ammount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($focusedField, equals: .myField)
// the application has a prble with constraints and is happening in the tool bar
// look in to the why is happpening but dont take to much time focus on the 100 days
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Button("Done") {
                                    focusedField = nil
                                }
                            }
                            
                        }
                    
                    Picker("number of people", selection: $people) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                    Picker("percentage", selection: $percent) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("How much tip do you want to leave?")
                }
            }
            .navigationTitle("WeSplit")
           

        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
