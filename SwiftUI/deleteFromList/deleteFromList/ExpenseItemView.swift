//
//  ExpenseItemView.swift
//  deleteFromList
//
//
//  Created by fernando babonoyaba on 6/27/23.

import SwiftUI

struct ExpenseItemView: View {
    @ObservedObject var item: Expenses
    @State private var name: String = ""
    @State private var account: String = "personal"
    @State private var amount: Double = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    let type = ["personal", "business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $name)
                
                Picker("account", selection: $account) {
                    ForEach(type, id: \.self) {type in
                        Text(type)
                    }
                }
                
                TextField("amount", value: $amount, format: .currency(code: "USD"))
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("save") {
                    let expense = ExpenceItem(name: name, type: account, ammount: amount)
                    item.item.append(expense)
                    dismiss()
                }
            }
            
        }
        
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(item: Expenses())
    }
}
