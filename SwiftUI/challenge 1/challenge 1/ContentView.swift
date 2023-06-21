//
//  ContentView.swift
//  challenge 1
//
//  Created by fernando babonoyaba on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = 0.0
//    @State private var conversion = 0.0
    @State private var unit = "Celsius"
    @State private var convetedUnit = "Fahrenheit"

    var conversion: Double {
        if unit == "Celsius" && convetedUnit == "Fahrenheit" {
            return (temperature * 1.8) + 32
        } else if unit == "Celsius" && convetedUnit == "Kelvin" {
            return temperature + 273.15
        } else if unit == "Fahrenheit" && convetedUnit == "Celsius" {
            return (temperature - 32) / 1.8
        } else if unit == "Fahrenheit" && convetedUnit == "Kelvin" {
            return (temperature + 459.67) / 1.8
        } else if unit == "Kelvin" && convetedUnit == "Celsius" {
            return temperature - 273.15
        } else if unit == "Kelvin" && convetedUnit == "Fahrenheit" {
            return temperature * 1.8 - 459.67
        }
        return temperature
//        - Celsius to Fahrenheit: `(celsius * 1.8) + 32`
//        - Celsius to Kelvin: `celsius + 273.15`
//        - Fahrenheit to Celsius: `(fahrenheit - 32) / 1.8`
//        - Fahrenheit to Kelvin: `(fahrenheit + 459.67) / 1.8`
//        - Kelvin to Celsius: `kelvin - 273.15`
//        - Kelvin to Fahrenheit: `kelvin * 1.8 - 459.67`
    }
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]

    var body: some View {
        Form {
            Section {
                TextField("temperature", value: $temperature, format: .number)
                    .keyboardType(.decimalPad)
                Picker("Unit", selection: $unit) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section {
                Picker (conversion.formatted(.number.precision(.fractionLength(1))), selection: $convetedUnit) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
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
