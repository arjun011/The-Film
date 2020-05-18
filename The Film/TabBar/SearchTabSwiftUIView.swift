//
//  SearchTabSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 05/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct SearchTabSwiftUIView: View {
    var body: some View {
        NavigationView {
            VStack{
                    Text("Search Tab")
                        .font(.largeTitle)
                    Spacer()
                }
            .navigationBarTitle(Text("Search View"), displayMode: .large)
            //.navigationBarTitle(Text("Search"))
        }
        
    }
}

struct SearchTabSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabSwiftUIView()
    }
}
