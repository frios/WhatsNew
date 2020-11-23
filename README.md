# WhatsNew

This package is a simple way of adding What's New pages to your app. The number of pages
is dynamically calculated based on the number of items in the Content array passed to the package.

How to use:

import SwiftUI
import WhatsNew

@main
struct myApp: App {
    @State var showWhatsNew = false
    let whatsNew = WhatsNew()

    var body: some Scene {
        WindowGroup {
            ContentView()
            .fullScreenCover(isPresented: $showWhatsNew, content: {
                let content = [Text("Hello World"), Text("Goodbye World")]
                WhatsNewView(content: content)
            })
            .onAppear(perform: {
                whatsNew.checkForUpdate(showWhatsNew: $showWhatsNew)
            })
        }
    }
}
