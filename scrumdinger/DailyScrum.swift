//
//  DailyScrum.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 4/8/21.
//

import Foundation
import SwiftUI

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color

    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
    }
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["J", "D", "F"], lengthInMinutes: 10, color: Color("Design")),
            DailyScrum(title: "Sales", attendees: ["J", "D", "F", "P"], lengthInMinutes: 15, color: Color("Sales")),
            DailyScrum(title: "Engineering", attendees: ["J", "D", "F", "P", "H"], lengthInMinutes: 20, color: Color("Engineering")),
        ]
    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.8
        var color: Color = .random
    }
    
    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}

