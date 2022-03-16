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
    let imageName: String
    let text : String
    
    public init(title: String = "New feature",
                imageName: String = "circle.fill",
                text: String = "This is a new feature for this app. And this text should wrap.") {
        self.title = title
        self.imageName = imageName
        self.text = text
    }
    
    public var body: some View {
        HStack (alignment: .center){
            if let image = UIImage(named: imageName) {
                Image(uiImage: image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(height: frameWidth * (image.size.height/image.size.width))
                    .bulletStyle()
            } else {
                Image(systemName: imageName)
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
            .multilineTextAlignment(.leading)
            .font(.subheadline)
            .padding(.bottom, 6)
        }
    }
}

struct BulletPointView_Previews: PreviewProvider {
    static var previews: some View {
        VStack (alignment: .leading){
            BulletPointView(imageName: "square.and.pencil")
            BulletPointView(imageName: "hare.fill")
            BulletPointView(imageName: "circle.fill")
            BulletPointView(imageName: "car.2.fill")
            BulletPointView(imageName: "switch.2")
            BulletPointView(imageName: "ellipsis")
        }.padding()
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

