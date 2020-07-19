//
//  DevicesListViewModel.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/4/20.
//

import SwiftUI

class DevicesListViewModel: ObservableObject {

    private lazy var scannerClient = LANScannerClient()

    @Published private(set) var devices: [Device] = []
    @Published private(set) var shouldShowProgressBar = false
    @Published var progress: Float = 0.0
    @Published var scanButtonState: ScanButtonState = .refresh
    @Published var isProgressVisible = false

    private var didStopScanManually = false

    init() {
        scannerClient.delegate = self
    }

    func startScan() {
        updateScanState(isScanning: true)
        didStopScanManually = false
        scannerClient.startScan()
    }

    func stopScan() {
        updateScanState(isScanning: false)
        didStopScanManually = true
        scannerClient.stopScan()
    }

}

// MARK: - Logic Helpers

private extension DevicesListViewModel {

    func updateScanState(isScanning: Bool) {
        withAnimation() {
            scanButtonState = isScanning ? .stop : .refresh
            isProgressVisible = isScanning
        }
    }

}

// MARK: - LANScannerClientDelegate

extension DevicesListViewModel: LANScannerClientDelegate {

    func lanScannerClientDidFindNewDevice(_ device: Device) {
        guard !devices.contains(device) else { return }
        devices.append(device)
    }

    func lanScannerClientDidFinishScanning(with status: LANScannerStatus) {
        if !didStopScanManually {
            updateScanState(isScanning: false)
        }
    }

    func lanScannerClientDidUpdateProgress(_ progress: Float) {
        self.progress = progress
    }

    func lanScannnerClientScanFailed() {
        updateScanState(isScanning: false)
    }

}
