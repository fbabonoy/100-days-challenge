//
//  ExpenceItem.swift
//  deleteFromList
//
//  Created by fernando babonoyaba on 6/27/23.
//

import Foundation

struct ExpenceItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let ammount: Double
}
