//
//  MeetingHeaderView.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 8/8/21.
//

import Foundation
import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    private var progress: Double {
        guard secondsRemaining > 0 else {
            return 1
        }
        let totalSeconds = Double(secondsRemaining + secondsElapsed)
        return Double(secondsElapsed) / totalSeconds
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    private var minutesRemainingMetric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }
    let scrumColor: Color
    var body: some View {
        VStack {
            ProgressView(value: 5, total:15)
                .progressViewStyle(ScrumProgressViewStyle(scrumColor: scrumColor))
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    HStack {
                        Text("\(secondsElapsed)")
                            .font(.caption)
                        Image(systemName: "hourglass.bottomhalf.fill")
                    }
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    HStack {
                        Text("\(secondsRemaining)")
                            .font(.caption)
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time remmaining"))
            .accessibilityLabel(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
            .padding([.top, .horizontal])
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, scrumColor: DailyScrum.data[0].color)
            .previewLayout(.sizeThatFits)
    }
}
