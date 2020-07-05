//
//  DevicesListViewModel.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/4/20.
//

import Combine

class DevicesListViewModel: ObservableObject {

    private lazy var scannerClient = LANScannerClient()

    @Published private(set) var devices: [Device] = []
    @Published private(set) var progress: Float = 0.0
    @Published private(set) var shouldShowProgressBar = false

    init() {
        scannerClient.delegate = self
        scannerClient.startScan()
    }

}

// MARK: - LANScannerClientDelegate

extension DevicesListViewModel: LANScannerClientDelegate {

    func lanScannerClientDidFindNewDevice(_ device: Device) {
        devices.append(device)
    }

    func lanScannerClientDidFinishScanning(with status: LANScannerStatus) {

    }

    func lanScannerClientDidUpdateProgress(_ progress: Float) {
        Log(progress.description)
        
    }

    func lanScannnerClientScanFailed() {
        
    }

}
