//
//  WhatsNewView.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI

public struct WhatsNewView<Content: View>: View {
    
    var numPages: Int
    let content: [Content]
    
    public init(numPages: Int, content: [Content]){
        self.numPages = numPages
        self.content = content
    }
        
    public var body: some View {
        TabView {
            ForEach(0..<numPages, id: \.self) { pageNum in
                WhatsNewPage(content: content[pageNum], pageNum: pageNum + 1)
            }
        }
        .background(Color.white)
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }}




