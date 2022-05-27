//
//  HomeTabView.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            
            NavigationView {
                HomeView()
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.large)
            }.tabItem {
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            
            NavigationView {
                HomeView()
            }.tabItem {
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "text.magnifyingglass")
                    Text("Home")
                }
            }
            
            NavigationView {
                HomeView()
            }.tabItem {
                VStack(alignment: .center, spacing: 5) {
                    Image(systemName: "person")
                    Text("Home")
                }
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
