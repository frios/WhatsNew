//
//  BulletPointView.swift
//
//
//  Created by Ferdinand G. Rios on 11/25/20.
//  Copyright © 2020-21 Ferdinand G. Rios. All rights reserved.
//


import SwiftUI

let frameWidth = 50.0

public struct BulletPointView<Content: View>: View {
    let title: LocalizedStringKey
    let imageName: String?
    let systemName: String?
    let content: Content
    
    public init(title: LocalizedStringKey = "New feature",
                imageName: String = "circle.fill",
                @ViewBuilder content: () -> Content) {
        self.title = title
        self.imageName = imageName
        self.systemName = nil
        self.content = content()
    }
    
    public init(title: LocalizedStringKey = "New feature",
                systemName: String = "circle.fill",
                @ViewBuilder content: () -> Content) {
        self.title = title
        self.imageName = nil
        self.systemName = systemName
        self.content = content()
    }

    public var body: some View {
        HStack (alignment: .center){
#if os(iOS)
            if let name = imageName, let image = UIImage(named: name) {
                Image(uiImage: image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(height: frameWidth * (image.size.height/image.size.width))
                    .bulletStyle()
            }
#elseif os(macOS)
            if let name = imageName, let image = NSImage(named: NSImage.Name(name)) {
                Image(nsImage: image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(height: frameWidth * (CGFloat(image.size.height)/CGFloat(image.size.width)))
                    .bulletStyle()
            }
#endif
            if let system = systemName {
                Image(systemName: system)
                    .renderingMode(.template)
                    .bulletStyle()
                    .font(.title)
            }
            VStack (alignment: .leading, spacing: 4){
                Text(title)
                    .fontWeight(.semibold)
                content
                    .foregroundColor(.secondary)
            }
            .textSelection(.enabled)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .font(.subheadline)
            .padding(.leading, 4)
            .padding(.bottom, 6)
        }
    }
}

struct Bullet: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:frameWidth)
            .scaledToFit()
            .foregroundColor(Color("AccentColor"))
    }
}

extension View {
    func bulletStyle() -> some View {
        modifier(Bullet())
    }
}

#if DEBUG
struct BulletPointView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack (alignment: .leading){
                BulletPointView(systemName: "square.and.pencil") {
                    Text("Bullet point 1")
                }
                BulletPointView(systemName: "hare.fill") {
                    Text("Bullet point 2")
                }
                BulletPointView(systemName: "circle.fill") {
                    Text("Bullet point 3")
                }
                BulletPointView(systemName: "car.2.fill") {
                    Text("Bullet point 4")
                }
                BulletPointView(systemName: "switch.2") {
                    Text("Bullet point 5")
                }
                BulletPointView(systemName: "ellipsis") {
                    Text("Bullet point 6")
                }
            }
        }.padding()
    }
}
#endif
