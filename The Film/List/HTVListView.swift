//
//  HTVListView.swift
//  The Film
//
//  Created by Arjun on 17/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct HTVListView: View {
    @Binding var TVDataModelList:[TVShowDataModel]?

    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(alignment: .center, spacing: 10) {
                    ForEach(TVDataModelList ?? []) { movieObject in
                      
                        NavigationLink {
                            TVShowDetailsView(tvShowID: movieObject.id)
                        } label: {
                            IDBMTVCellView(movieObject: movieObject)
                        }
                    }
                }.padding([.horizontal, .vertical])
            }
        }
    }
}

//struct HTVListView_Previews: PreviewProvider {
//    static var previews: some View {
//        HTVListView()
//    }
//}
