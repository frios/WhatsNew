# WhatsNew

This package is a simple way of adding What's New pages to your app. The pages
are dynamically created based on the number of items passed to the WhatsNewView.

How to use:

1) In your Asset Catalog, set your AccentColor.

2) Create the content for each whats new page you want displayed. You can use What's New BulletPoint struct to add bullet points with images, bold titles and explanatory text. e.g.

```
struct WhatsNewPageView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            BulletPointView(title: "We now have SEARCH!!!",
                            image: Image (systemName: "paintbrush.fill"),
                            text: "Search to find books that have been on previous best seller lists.")
            BulletPointView(title: "More bugs squashed.",
                            image: Image (systemName: "folder.fill"),
                            text: "And the hits keep coming")
        }
        .padding()
    }
}
```

3) Import WhatsNew into your startup file.

4) In your @main struct, create a state variable to control display of WhatsNew pages.

5) Instantiate a WhatsNew class. Use the (alwaysShow: true) parameter to always display WhatsNew content for testing

6) Add the .onAppear modifier and .sheet modifier to your ContentView() call.

```
import SwiftUI
import WhatsNew

@main
struct PackageTesterApp: App {
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
                        WhatsNewHeader { //first page
                            WhatsNewPageView()
                        }
                        WhatsNewHeader { //optional second page, etc.
                            WhatsNewPageView2()
                        }
                    }
                }
        }
    }
}

```

And that should do it!
