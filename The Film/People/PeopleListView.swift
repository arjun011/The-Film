//
//  PeopleListView.swift
//  The Film
//
//  Created by Arjun on 19/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct PeopleListView: View {
    @ObservedObject private var model = PersonsModel()
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        VStack(alignment: .center) {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: threeColumnGrid, alignment: .center, spacing: 10) {
                    ForEach(self.model.popularPersonsList?.results ?? [PersonsDataModel]()) { person in
                        
                        NavigationLink(destination: PersonDetailsView(personID: person.id)) {
                            PopularPersonsCellSwiftUIView(persons: person)
                        }
                    }
                }.padding([.horizontal, .vertical])
            }
        }.onAppear {
            self.model.getPopularPersonsList()
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
