//
//  DeviceDetailView.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/4/20.
//

import SwiftUI

struct DeviceDetailView: View {

    var device: Device

    var body: some View {
        Text(device.ipAddress)
    }
    
}
