//
//  MotivationQuotesApp.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 01/06/21.
//

import SwiftUI

@main
struct MotivationQuotesApp: App {
    @StateObject var quotesVM: QuotesViewModel = QuotesViewModel()
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(quotesVM)
        }
        
    }
}
