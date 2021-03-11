//
//  BulletPointView.swift
//  mFood Vendor
//
//  Created by Ferdinand Rios on 11/23/20.
//

import SwiftUI

public struct BulletPointView: View {
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Label(
            title: {
                Text(text)
            },
            icon: {
                Image (systemName: "circle.fill")
                    .font(.caption2)
            }
        )
    }
}

struct BulletPointView_Previews: PreviewProvider {
    static var previews: some View {
        BulletPointView(text: "Test")
    }
}
