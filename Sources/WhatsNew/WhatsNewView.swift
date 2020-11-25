//
//  WhatsNewView.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI

public struct WhatsNewView<Content: View>: View {
    
//    @EnvironmentObject var properties: WhatsNew
    
    let content: Content
    
    public init(@ViewBuilder contentProvider: () -> Content){
        self.content = contentProvider()
    }
        
    public var body: some View {
        TabView {
            content
//            ForEach(0..<content.count, id: \.self) { pageNum in
//                WhatsNewPage(content: content[pageNum], pageNum: pageNum + 1, totalPages: content.count)
//            }
        }
//        .background(properties.pageColor)
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}




