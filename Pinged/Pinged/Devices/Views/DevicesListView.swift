//
//  DevicesListView.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/3/20.
//

import SwiftUI

struct DevicesListView: View {

    @ObservedObject var devicesListViewModel = DevicesListViewModel()

    var body: some View {
        NavigationView {
            List(devicesListViewModel.devices) { device in
                NavigationLink(destination: DeviceDetailView(device: device)) {
                    SimpleListRow(title: device.ipAddress, detail: device.macAddressLabel() ?? "-")
                }
            }
            .navigationBarTitle("Devices")
        }
    }

}

struct DevicesListView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesListView(devicesListViewModel: DevicesListViewModel())
    }
}
