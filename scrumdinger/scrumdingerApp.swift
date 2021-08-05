//
//  scrumdingerApp.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 4/8/21.
//

import SwiftUI

@main
struct scrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
