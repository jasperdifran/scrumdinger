//
//  DailyScrum.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 4/8/21.
//

import Foundation
import SwiftUI

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var colour: Color
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["J", "D", "F"], lengthInMinutes: 10, colour: Color("Design")),
            DailyScrum(title: "Sales", attendees: ["J", "D", "F", "P"], lengthInMinutes: 15, colour: Color("Sales")),
            DailyScrum(title: "Engineering", attendees: ["J", "D", "F", "P", "H"], lengthInMinutes: 20, colour: Color("Engineering")),
        ]
    }
}
