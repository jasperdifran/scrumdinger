//
//  ContentView.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 4/8/21.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack {
                
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                }
            }
            .padding()
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct MeetingView_Preview: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}

