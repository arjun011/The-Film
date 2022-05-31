//
//  CastHorizontalListView.swift
//  The Film
//
//  Created by Arjun on 27/05/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct CastHorizontalListView: View {
    var castList = [castDataModel]()
    var body: some View {
        
        //Cast List
        VStack(alignment: .leading, content: {
            Text("Cast")
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(alignment: .center, spacing: 15, content: {
                    ForEach(self.castList, id: \.id) { cast in
                        NavigationLink(destination: PersonDetailsView(personID: cast.id)) {
                            MovieDetailCastSwiftUIView(cast: cast)
                        }
                    }
                }).padding(.leading)
            }
        })
    }
}

struct CastHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        CastHorizontalListView()
    }
}
