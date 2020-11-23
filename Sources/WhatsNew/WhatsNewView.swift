//
//  WhatsNewView.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI

public struct WhatsNewView<Content: View>: View {
    
    let content: [Content]
    let pageColor: Color
    let fontColor: Color
    
    public init(content: [Content], pageColor: Color = .white, fontColor: Color = .primary){
        self.content = content
        self.pageColor = pageColor
        self.fontColor = fontColor
    }
        
    public var body: some View {
        TabView {
            ForEach(0..<content.count, id: \.self) { pageNum in
                WhatsNewPage(content: content[pageNum], pageNum: pageNum + 1, totalPages: content.count, fontColor: fontColor)
            }
        }
        .background(pageColor)
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}




