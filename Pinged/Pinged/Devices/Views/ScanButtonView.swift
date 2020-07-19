//
//  ScanButtonView.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/6/20.
//

import SwiftUI

enum ScanButtonState {
    case stop
    case refresh
}


struct ScanButton: View {

    @Binding var state: ScanButtonState
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            if state == .stop {
            Image(systemName: "stop.circle")
                    .font(.title)
            } else {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .font(.title)
            }
        })
    }

}

struct ScanButtonView_Previews: PreviewProvider {
    @State static var state: ScanButtonState = .refresh

    static var previews: some View {
        ScanButton(state: $state) {
            withAnimation {
                Self.state = .stop
            }
        }
    }
}
