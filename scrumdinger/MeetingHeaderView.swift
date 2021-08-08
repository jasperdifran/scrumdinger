//
//  MeetingHeaderView.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 8/8/21.
//

import Foundation
import SwiftUI

struct MeetingHeaderView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total:15)
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.full")
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.full")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time remmaining"))
            .accessibilityLabel(Text("10 Minutes"))
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView()
    }
}
