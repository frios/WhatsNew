//
//  WhatsNewDemoApp.swift
//  WhatsNewDemo
//
//  Created by Stéphane Peter on 6/29/23.
//

import SwiftUI
import WhatsNew

@main
struct WhatsNewDemoApp: App {
    let whatsNew = WhatsNew(alwaysShow: true)
    @State private var showWhatsNew = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    whatsNew.checkForUpdate(showWhatsNew: $showWhatsNew)
                })
                .sheet(isPresented: $showWhatsNew) {
                    WhatsNewView {
                        PageView(page: 1)
                        PageView(page: 2)
                    }
                }
        }
    }
}
