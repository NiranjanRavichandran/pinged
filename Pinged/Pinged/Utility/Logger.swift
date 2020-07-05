//
//  Logger.swift
//  Pinged
//
//  Created by Niranjan Ravichandran on 7/3/20.
//

import Foundation
import os

public func Log(_ message: String, file: String = #file, line: Int = #line) {
    let fileName = (file as NSString).lastPathComponent
    let printableString = String(format: "[%@: %d] %@", fileName, line, message)
    print(printableString)
    os_log(.debug, "[%@: %d] %@", fileName, line, message)
}

