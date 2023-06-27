//
//  ContentView.swift
//  deleteFromList
//
//  Created by fernando babonoyaba on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.item, id: \.name) { cell in
                    Button {
                        
                    } label: {
                        Text(cell.name)
                    }

                }
                .onDelete(perform: removeCell)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenceItem(name: "name", type: "car payment", ammount: 300)
                    expenses.item.append(expense)
                } label: {
                    Image(systemName: "plus")
                }

            }

        }
    }
    
    func removeCell(_ IndexSet: IndexSet) {
        expenses.item.remove(atOffsets: IndexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
