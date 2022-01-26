//
//  HomeView.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var model = HomeOO()

    var body: some View {
        
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                
                Picker("dsd", selection: $model.selectedCategoery) {
                    Text("Movies").tag(0)
                    Text("TV Show").tag(1)
                    Text("Person").tag(2)
                }.pickerStyle(.segmented)
                    .padding([.horizontal, .bottom])
                    
                
                selectedCategoery()
                
                Spacer()
                
            }.searchable(text: $model.searchTxt)
        }
        
        
    }
    
    func selectedCategoery() -> AnyView {
        
        switch self.model.selectedCategoery {
        case 0:
            return AnyView(MovieView())
        case 1:
            return AnyView(TVShowView())
        default :
            return AnyView(PeopleListView())
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
