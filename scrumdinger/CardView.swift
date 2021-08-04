//
//  CardView.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 4/8/21.
//

import Foundation
import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .font(.caption)
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .font(.caption)
            }
        }
        .padding()
    }
}

struct CardView_Preview: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.colour)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
