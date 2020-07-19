//
//  DevicesProgressView.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/19/20.
//

import SwiftUI

struct DevicesProgressView: View {

    @Binding var progress: Float

    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading, spacing: 5) {
                Text(String(format: "%.0f %%", self.progress * 100))
                    .frame(width: geometry.size.width, alignment: .leading)
                    .font(.footnote)
                    .foregroundColor(Color(UIColor.gray))

                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: self.progresHeight(from: geometry))
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.lightGray))

                    Rectangle().frame(width: min(CGFloat(self.progress) * geometry.size.width, geometry.size.width), height: self.progresHeight(from: geometry))
                        .foregroundColor(Color(UIColor.systemBlue))
                        .animation(.linear)
                }.cornerRadius(45.0)
            }
        }
    }

}

// MARK: - UI Helpers

private extension DevicesProgressView {

    func progresHeight(from geometry: GeometryProxy) -> CGFloat {
        return geometry.size.height * 0.75
    }

}

struct DevicesProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesProgressView(progress: .constant(0.4))
            .frame(width: UIScreen.main.bounds.width - 40, height: 20)
    }
}
