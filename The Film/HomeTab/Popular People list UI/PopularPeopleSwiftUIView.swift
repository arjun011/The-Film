//
//  PopularPeopleSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
//import QGrid
struct PopularPeopleSwiftUIView: View {
   @ObservedObject private var model = PersonsModel()
    var body: some View {
        ZStack {
            Color.black
            VStack {
                if self.model.popularPersonsList?.results.count ?? 0 > 0 {
//                    QGrid(self.model.popularPersonsList?.results ?? [PersonsDataModel](), columns: 3, columnsInLandscape: 3, vSpacing: 5, hSpacing: 5, vPadding: 0, hPadding: 5, isScrollable: true, showScrollIndicators: false) { person in
//
//                        NavigationLink(destination: PopularPeopledetailsSwiftUIView(personID: person.id)) {
//                            PopularPersonsCellSwiftUIView(persons: person)
//                        }
//                    }
                    Button(action: {
                        self.model.pageIndex = self.model.pageIndex + 1
                        self.model.getPopularPersonsList()
                    }) {
                        Text("Load more")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.white)
                            .padding()
                    }
                }else {
                    LoadingSwiftUIView()
                }
                
            }.onAppear {
                self.model.getPopularPersonsList()
            }
           
        }
    }
}

struct PopularPeopleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPeopleSwiftUIView()
    }
}
