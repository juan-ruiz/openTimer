//
//  Item.swift
//  openTimer
//
//  Created by Juan Ruiz on 21/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
