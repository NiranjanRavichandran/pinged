//
//  SimpleListRow.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/3/20.
//

import SwiftUI

struct SimpleListRow: View {

    var title: String = ""
    var detail: String = ""

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(title)
                    .font(.title)
                    .truncationMode(.middle)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(detail)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .padding(.all, 10)
    }

}

struct SimpleListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SimpleListRow(title: "Title", detail: "Detail")
        }
    }
}
