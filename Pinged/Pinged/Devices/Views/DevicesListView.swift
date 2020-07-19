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
            VStack {
                if self.devicesListViewModel.isProgressVisible {
                    DevicesProgressView(progress: $devicesListViewModel.progress)
                        .frame(height: 15)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
                        .transition(.move(edge: .top))
                        .animation(.easeIn(duration: 0.4))
                }

                List(devicesListViewModel.devices) { device in
                    NavigationLink(destination: DeviceDetailView(device: device)) {
                        SimpleListRow(
                            title: device.ipAddress,
                            detail: device.brand ?? "-"
                        )
                    }
                }
            }
            .navigationBarTitle("Devices")
            .navigationBarItems(trailing: makeRightBarButtonItem())
        }
    }

}

private extension DevicesListView {

    func makeRightBarButtonItem() -> some View {
        return ScanButton(state: $devicesListViewModel.scanButtonState) {
            if self.devicesListViewModel.scanButtonState == .refresh {
                self.devicesListViewModel.startScan()
            } else {
                self.devicesListViewModel.stopScan()
            }
        }
    }

}

struct DevicesListView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesListView(devicesListViewModel: DevicesListViewModel())
    }
}
