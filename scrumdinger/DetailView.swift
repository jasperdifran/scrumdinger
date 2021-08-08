//
//  DetailView.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 4/8/21.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresented = false
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    
    var body: some View {
        List {
            Section(header: Text("Meeting Details")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
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
            data = scrum.data
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                        scrum.update(from: data)
                    })
            }
        }
    }
}

struct DetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}

