//
//  BarcodeScannerViewModel.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Natasha Radika on 16/04/24.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    // ganti dari state ke published
    // biar gausa diinisialisasi makanya diassign ""
    @Published var scannedCode = ""
    // opsional
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        return scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .red : .green
    }
}
