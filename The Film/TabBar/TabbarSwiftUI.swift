//
//  TabbarSwiftUI.swift
//  The Film
//
//  Created by Arjun C on 05/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI

struct TabbarSwiftUI: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TabView {
                HomeTabSwiftUIView().tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Home")
                            .fontWeight(.medium)
                    }
                }
                SearchTabSwiftUIView().tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                            .fontWeight(.medium)
                    }
                }
                FavTabSwiftUIView().tabItem {
                    VStack {
                        Image(systemName: "heart")
                        Text("Fav")
                            .fontWeight(.medium)
                    }
                }
                MyStufTabSwiftUIView().tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("My stuf")
                            .fontWeight(.medium)
                    }
                }
            }
        }
        
            
        }
}

struct TabbarSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        TabbarSwiftUI()
    }
}
