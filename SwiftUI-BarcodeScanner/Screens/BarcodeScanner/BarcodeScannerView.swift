//
//  ContentView.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Natasha Radika on 01/04/24.
//

import SwiftUI

// ini view tampilannya
struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem).frame(maxWidth: .infinity, maxHeight: 300)
                Spacer().frame(height: 50)
                Label("Scanned Barcode: ", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(viewModel.statusText).bold().font(.largeTitle).foregroundColor(viewModel.statusTextColor).padding()
                
                
            }.navigationTitle("Barcode Scanner")
                .alert(item: $viewModel.alertItem) { (alertItem: AlertItem) in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message)
                      , dismissButton: alertItem.dismissButton)
                
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
