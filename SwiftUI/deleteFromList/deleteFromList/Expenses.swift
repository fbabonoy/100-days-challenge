//
//  Expenses.swift
//  deleteFromList
//
//  Created by fernando babonoyaba on 6/27/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var item = [ExpenceItem]() {
        didSet {
            if let encode = try? JSONEncoder().encode(item) {
                UserDefaults.standard.set(encode, forKey: "Items")            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decode = try? JSONDecoder().decode([ExpenceItem].self, from: savedItems) {
                item = decode
                return
            }
        }
    }
}


class Expensess: ObservableObject {
    @Published var item = [ExpenceItem]() {
        didSet {
            if let encode = try? JSONEncoder().encode(item) {
                UserDefaults.standard.set(encode, forKey: "items")
            }
        }
    }
    
    init () {
        if let getData = UserDefaults.standard.data(forKey: "items") {
            if let decoded = try? JSONDecoder().decode([ExpenceItem].self, from: getData) {
                item = decoded
                return
            }
        }
    }
}


class Expensesss: ObservableObject {
    @Published var item = [ExpenceItem]() {
        didSet {
            if let encode = try? JSONEncoder().encode(item) {
                UserDefaults.standard.set(encode, forKey: "Itemss")
            }
        }
    }
    
    init () {
        if let getData = UserDefaults.standard.data(forKey: "Itemss") {
            if let decode = try? JSONDecoder().decode([ExpenceItem].self, from: getData) {
                item = decode
                return
            }
        }
    }
}
