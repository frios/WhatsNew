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
    let image: Image
    let text : String
    
    public init(title: String = "New feature", image: Image = Image(systemName: "circle.fill"), text: String = "This is a new feature for this app.") {
        self.title = title
        self.image = image
        self.text = text
    }
    
    public var body: some View {
        HStack (alignment: .center){
            image
                .font(.title2)
                .foregroundColor(Color("AccentColor"))
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
        BulletPointView()
    }
}
