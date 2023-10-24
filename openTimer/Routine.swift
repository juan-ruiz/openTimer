//
//  Item.swift
//  openTimer
//
//  Created by Juan Ruiz on 21/10/23.
//

import Foundation
import SwiftData


@Model
final class Routine: Identifiable {
    var creationDate: Date
    var countdowns: [Countdown]
    var id = UUID()
    var name: String
    
    
    init(name: String) {
        self.creationDate = Date()
        self.countdowns = []
        self.name = name
    }
}


