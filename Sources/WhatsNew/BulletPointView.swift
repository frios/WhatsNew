//
//  BulletPointView.swift
//
//
//  Created by Ferdinand G. Rios on 11/25/20.
//  Copyright © 2020-21 Ferdinand G. Rios. All rights reserved.
//


import SwiftUI

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
            Image(uiImage: (UIImage(systemName: imageName) ?? UIImage(named: imageName))!)
                .renderingMode(.template)
                .font(.largeTitle)
                .frame(width:50)
                .scaledToFit()
//                .imageScale(.large)
                .foregroundColor(Color("AccentColor"))
                .foregroundColor(.accentColor)
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
        }
    }
}


