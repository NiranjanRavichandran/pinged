//
//  ContentView.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/3/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DevicesListView(devicesListViewModel: DevicesListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
