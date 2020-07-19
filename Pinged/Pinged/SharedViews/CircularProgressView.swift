//
//  CircularProgressView.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/5/20.
//

import SwiftUI

struct CircularProgressView: View {

    //MARK: UI Constants
    let progressBarWidth: CGFloat = 3.0

    // MARK: Logic Variables
    @Binding public var progress: Float

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: progressBarWidth)
                .opacity(0.1)
                .foregroundColor(.blue)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(
                    lineWidth: progressBarWidth,
                    lineCap: .round,
                    lineJoin: .round
                ))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

        }
    }

}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: .constant(0.3))
    }
}
