//
//  Countdown.swift
//  openTimer
//
//  Created by Juan Ruiz on 23/10/23.
//

import Foundation
import SwiftData

@Model
final class Countdown: Identifiable {
    var type: TypeOfCountdown
    var timeInSeconds: Int
    var id = UUID()
    var name: String
    
    
    init(timeInSeconds: Int, type: TypeOfCountdown) {
        self.timeInSeconds = timeInSeconds
        self.type = type
    }
}

enum TypeOfCountdown {
    case rest, activity
}

