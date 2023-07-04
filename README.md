# WhatsNew

This package is a simple way of adding What's New pages to your app. The pages
are dynamically created based on the number of items passed to the WhatsNewView.

This framework supports iOS, iPadOS, tvOS (15.0 and above) and macOS (12.0 and above).

## How to use:

1) In your target's General Settings, make sure your app Display Name is set as you want it.

2) Create the content for each What's New page you want displayed. You can use What's New `BulletPointView` struct to add bullet points with images, bold titles and explanatory text. The component will use whatever accent color you set for the page.

```swift
struct WhatsNewPageView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            BulletPointView(title: "We now have SEARCH!!!",
                            systemName: "paintbrush.fill",
                            text: "Search to find books that have been on previous best seller lists.")
            BulletPointView(title: "More bugs squashed.",
                            imageName: "myTruck",
                            text: "And the hits keep coming")
                            
            Spacer()
        }
        .padding()
        .accentColor(Color.red)
    }
}
```

... same for each additional page


3) Import WhatsNew into your startup file.

4) In your `@main` struct, create a state variable to control display of WhatsNew pages.

5) Instantiate a `WhatsNew` class. You can use the `(alwaysShow: true)` parameter to always display WhatsNew content for testing.

6) Add the `.onAppear` modifier to check for updates in the version number of the app. Add the `.sheet` modifier to your `ContentView()` call to display the What's New compomnent.

```swift
import SwiftUI
import WhatsNew

@main
struct PackageTesterApp: App {
    let whatsNew = WhatsNew(alwaysShow: true)
    @State private var showWhatsNew = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    whatsNew.checkForUpdate(showWhatsNew: $showWhatsNew)
                }
                .sheet(isPresented: $showWhatsNew) {
                    WhatsNewView {
                        WhatsNewPageView()
                        WhatsNewPageView2()
                    }
                }
        }
    }
}

```

And that should do it!
