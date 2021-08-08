//
//  MeetingFooterView.swift
//  scrumdinger
//
//  Created by Jasper Di Francesco on 9/8/21.
//

import Foundation
import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else {return nil}
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy {$0.isCompleted}
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else {
            return "No more speaker"
        }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MeetingFooterView_Preview: PreviewProvider {
    static var speakers = [ScrumTimer.Speaker(name: "kim", isCompleted: false), ScrumTimer.Speaker(name: "bill", isCompleted: false)]
    static var previews: some View {
        MeetingFooterView(speakers: speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
