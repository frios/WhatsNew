//
//  WhatsNew1.swift
//  mFood
//
//  Created by Feldy Rios on 8/27/20.
//  Copyright © 2020 Feral Innovations, Inc. All rights reserved.
//

import SwiftUI


public struct WhatsNewPage<Content: View>: View {
    @Environment(\.presentationMode) var presentationMode
    
    let content: Content
    let pageNum : Int
    let totalPages: Int
     
    var appName: String = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    init(content: Content, pageNum: Int, totalPages: Int){
        self.content = content
        self.pageNum = pageNum
        self.totalPages = totalPages
    }

    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
                .padding(.trailing)
            }
            
            Text(totalPages > 1 ? "What's new in \(appName)? \n(page \(pageNum))": "What's new in \(appName)?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.vertical, 20)
            
            content
            
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}


