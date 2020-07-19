//
//  LANScannerClient.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/3/20.
//

import Foundation
import Combine

protocol LANScannerClientDelegate: AnyObject {
    func lanScannerClientDidFindNewDevice(_ device: Device)
    func lanScannerClientDidFinishScanning(with status: LANScannerStatus)
    func lanScannerClientDidUpdateProgress(_ progress: Float)
    func lanScannnerClientScanFailed()
}

public class LANScannerClient: NSObject {

    private lazy var scanner = MMLANScanner(delegate: self)!
    weak var delegate: LANScannerClientDelegate?

    override public init() {
        super.init()
    }

    func startScan() {
        scanner.start()
        Log("Scanner started")
    }

    func stopScan() {
        scanner.stop()
        Log("Scanner stopped")
    }

}

// MARK: - MMLANScannerDelegate

extension LANScannerClient: MMLANScannerDelegate {

    public func lanScanDidFindNewDevice(_ device: MMDevice!) {
        delegate?.lanScannerClientDidFindNewDevice(device)
    }

    public func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
        let status = LANScannerStatus(scannerStatus: status)
        if status == .finished {
            delegate?.lanScannerClientDidUpdateProgress(1.0)
            Log("Scanner finished")
        }
        delegate?.lanScannerClientDidFinishScanning(with: status)
    }

    public func lanScanDidFailedToScan() {
        Log("Scanner failed")
        delegate?.lanScannnerClientScanFailed()
    }

    public func lanScanProgressPinged(_ pingedHosts: Float, from overallHosts: Int) {
        let progress = pingedHosts/Float(overallHosts)
        delegate?.lanScannerClientDidUpdateProgress(progress)
    }

}
