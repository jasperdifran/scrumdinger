//
//  DetailView.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 4/8/21.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    @State private var isPresented = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Details")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityElement(children: .ignore)
                        .accessibilityValue(Text("Start meeting"))
                }
                HStack {
                    Label("Meeting Length", systemImage: "clock")
                        .accessibilityElement(children: .ignore)
                        .accessibilityValue(Text("Meeting Length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) Minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintbrush")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
            Section(header: Text("Meeting Attendees")) {
                ForEach (scrum.attendees, id: \.self) {attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityLabel(Text(attendee))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView()
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                    })
            }
        }
    }
}

struct DetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
