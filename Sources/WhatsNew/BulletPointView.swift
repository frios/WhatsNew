//
//  BulletPointView.swift
//
//
//  Created by Ferdinand G. Rios on 11/25/20.
//  Copyright © 2020-21 Ferdinand G. Rios. All rights reserved.
//


import SwiftUI

let frameWidth = 50.0

public struct BulletPointView: View {
    let title: String
    let imageName: String?
    let systemName: String?
    let text : String
    
    public init(title: String = "New feature",
                imageName: String = "circle.fill",
                text: String = "This is a new feature for this app. And this text should wrap.") {
        self.title = title
        self.imageName = imageName
        self.systemName = nil
        self.text = text
    }
    
    public init(title: String = "New feature",
                systemName: String = "circle.fill",
                text: String = "This is a new feature for this app with a system icon. And this text should wrap.") {
        self.title = title
        self.imageName = nil
        self.systemName = systemName
        self.text = text
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
                Text(text)
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
                BulletPointView(systemName: "square.and.pencil")
                BulletPointView(systemName: "hare.fill")
                BulletPointView(systemName: "circle.fill")
                BulletPointView(systemName: "car.2.fill")
                BulletPointView(systemName: "switch.2")
                BulletPointView(systemName: "ellipsis")
            }
        }.padding()
    }
}
#endif
