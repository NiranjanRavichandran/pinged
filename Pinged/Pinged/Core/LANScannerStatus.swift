//
//  LANScannerStatus.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/4/20.
//

import Foundation

public enum LANScannerStatus {
    case finished
    case cancelled

    init(scannerStatus: MMLanScannerStatus) {
        if scannerStatus == MMLanScannerStatusFinished {
            self = .finished
        } else {
            self = .cancelled
        }
    }
}
