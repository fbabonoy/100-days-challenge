//
//  ContentView.swift
//  deleteFromList
//
//  Created by fernando babonoyaba on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var itemView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.item) { cell in
                    HStack {
                        VStack {
                            Text(cell.name)
                                .font(.headline)
                            Text(cell.type)
                        }
                        
                        Spacer()
                        
                        Text(cell.ammount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeCell)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    itemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $itemView) {
                ExpenseItemView(item: expenses)
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
