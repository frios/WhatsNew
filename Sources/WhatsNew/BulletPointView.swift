//
//  BulletPointView.swift
//  mFood Vendor
//
//  Created by Ferdinand Rios on 11/23/20.
//

import SwiftUI

public struct BulletPointView: View {
    let title: String
    let image: Image
    let text : String
    
    public init(title: String, image: Image, text: String) {
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
            .font(.subheadline)
            .padding(.bottom, 6)
        }
    }
}

struct BulletPointView_Previews: PreviewProvider {
    static var previews: some View {
        BulletPointView(title: "Test", image: Image (systemName: "paintbrush.fill"), text: "This is a test of the whats new bullet point")
    }
}
