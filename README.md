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

Instantiate a WhatsNew class.

```
    let whatsNew = WhatsNew()
```

Set any properties on the object that you need set. The properties have common sense defaults so its OK to leave them be.

```
    whatNew.alwaysShow = true
    whatsNew.pageColor = .black
    whatNew.fontColor = .white
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
            let content = [AnyView(page1), AnyView(page2)]
            WhatsNewView (content: content)
                .environmentObject(whatsNew)
        })
        .onAppear(perform: {
            whatsNew.checkForUpdate(showWhatsNew: $showWhatsNew)
        })
    }
}
```

And that should do it!
