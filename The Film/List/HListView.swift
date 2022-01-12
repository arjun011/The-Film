//
//  HListView.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct HListView: View {
    
    @Binding var movieDataModelList:[MovieDataModel]?
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(alignment: .center, spacing: 10) {
                    ForEach(movieDataModelList ?? []) { movieObject in
                        IDBMCellView(movieObject: movieObject)
                    }
                }.padding([.horizontal, .vertical])
                   // .background(Color.yellow)
            }
        }
        
  
    }
}

//struct HListView_Previews: PreviewProvider {
//    static var previews: some View {
//        HListView()
//    }
//}
