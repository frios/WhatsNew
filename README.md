# WhatsNew

This package is a simple way of adding What's New pages to your app. The number of pages
is dynamically calculated based on the number of items in the Content array passed to the package.

How to use:

Import WhatsNew into your startup file.

```
    import WhatsNew
```

In your @main struct, create a state variable to control display of WhatsNew pages.

```
    @State var showWhatsNew = false
```

Instantiate a WhatsNew class. Use the (alwaysShow: true) parameter to always display WhatsNew content for testing

```
    let whatsNew = WhatsNew()
```


Create the content for each page you want displayed

```
    var page1: some View {
        VStack (alignment: .leading){
            Text("Here is a list of new features:")
                .padding(.bottom, 10)
            BulletPointView(text: "Feature 1")
            BulletPointView(text: "Feature 2")
            BulletPointView(text: "Feature 3")
            BulletPointView(text: "Feature 4")
            BulletPointView(text: "Feature 5")
            BulletPointView(text: "Feature 6")
            BulletPointView(text: "Feature 7")
        }
    }

    var page2: some View {
        Text("Goodbye World")
    }
```

Add the .fullScreenCover modifier and .onAppear modifier to your ContentView() call

```
var body: some Scene {
    WindowGroup {
        ContentView()
        .fullScreenCover(isPresented: $showWhatsNew, content: {
            WhatsNewView {
                page1()
                page2()
            }
        })
        .onAppear(perform: {
            whatsNew.checkForUpdate(showWhatsNew: $showWhatsNew)
        })
    }
}
```

And that should do it!
