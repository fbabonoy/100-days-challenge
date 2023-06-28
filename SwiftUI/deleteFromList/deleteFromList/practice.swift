//
//  practice.swift
//  deleteFromList
//
//  Created by fernando babonoyaba on 6/28/23.
//

import Foundation
import SwiftUI


//Sure, here are some code settings that will require you to use a specific topic:
//
//## UserDefaults
//
//**Code Setting:**

class StoredBool {
    // TODO: Store a Bool value in UserDefaults
    func setBool() {
        UserDefaults.standard.set(true, forKey: "myBoolKey")

    }
    
    // TODO: Retrieve the Bool value from UserDefaults
    func getBool() {
        let myBool = UserDefaults.standard.bool(forKey: "myBoolKey")

    }
    
    
}
//**Description:** In this code setting, you need to store a `Bool` value in UserDefaults and retrieve it later. Add the code to store and retrieve the `Bool` value in the designated areas.
//
//## Codable
//
//**Code Setting:**

// TODO: Encode the struct to JSON
struct MyStruct: Codable {
    let name: String
    let age: Int
}

class StructData {
    
    var myStruct = MyStruct(name: "John", age: 30) {
        didSet {
            if let jsonData = try? JSONEncoder().encode(myStruct) {
                UserDefaults.standard.set(jsonData, forKey: "myStruct")
            }
        }
       
    }
        // TODO: Decode the JSON to the struct
    init() {
        if let jsonData = UserDefaults.standard.data(forKey: "myStruct") {
            let myStruct = try? JSONDecoder().decode(MyStruct.self, from: jsonData)
        }
    }
}

//**Description:** In this code setting, you need to create a `struct` that conforms to `Codable`, encode it to JSON, and decode it back to the `struct`. Add the code to perform these tasks in the designated areas.
//
//## sheet()
//
//**Code Setting:**

// TODO: Define a View to be presented
struct MySheetView: View {
    var body: some View {
        Text("This is a sheet view")
    }
}

// TODO: Use sheet() to present the view
struct MyParentView: View {
    @State private var showSheet = false

    var body: some View {
        Button("Show Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            // TODO: Add the view to be presented here
            MySheetView()
        }
    }
}


//**Description:** In this code setting, you need to define a `View` to be presented using `sheet()`, and add the code to present the `View` when a button is tapped. Add the code to present the `View` in the designated area.
//
//## onDelete()
//
//**Code Setting:**

struct MyListView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
            .onDelete(perform: deleteItem)
        }
    }

    // TODO: Add the deleteItem function
    func deleteItem(index: IndexSet) {
        items.remove(atOffsets: index)
    }
}


//**Description:** In this code setting, you need to add the `onDelete()` method to delete an item from a list in SwiftUI. Add the code to delete an item in the designated area.
//## @StateObject
//**Code Setting:**

class MyData: ObservableObject {
    @Published var count = 0
}

struct MyView1: View {
    @StateObject var myData = MyData()

    var body: some View {
        VStack {
            Text("\(myData.count)")
            Button("Increment") {
                myData.count += 1
            }
        }
    }
}

struct MyView2: View {
    @StateObject var myData: MyData

    var body: some View {
        Text("\(myData.count)")
    }
}

struct MyParentView2: View {
    @StateObject var myData = MyData()

    var body: some View {
        VStack {
            MyView1()
            MyView2(myData: myData)
        }
    }
}


//**Description:** In this code setting, you need to create an observable object using `@StateObject` and use it in multiple views. Add the code to create and use the observable object in the designated areas.

//I hope this helps! Let me know if you have any further questions.
