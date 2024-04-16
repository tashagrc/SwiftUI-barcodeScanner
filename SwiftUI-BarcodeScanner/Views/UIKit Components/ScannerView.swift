//
//  ScannerView.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Natasha Radika on 06/04/24.
//

// ini coordinator
import SwiftUI

// UI view ke coordinator ke SwiftUI View
struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self) // self adalah scanner view
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            // pass info into scanner view
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannerValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
        
        
    }
    
//    typealias UIViewControllerType = ScannerVC
}
