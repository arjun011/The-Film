//
//  TVShowListSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import QGrid
struct TVShowListSwiftUIView: View {
   @ObservedObject private var tvShowModel = TVShowModel()
    var body: some View {
        ZStack {
            Color.black
            VStack {
                if tvShowModel.TVShowListArray?.results.count ?? 0 > 0 {
                    QGrid(tvShowModel.TVShowListArray?.results ?? [TVShowDataModel](), columns: 2, columnsInLandscape: 3, vSpacing: 5, hSpacing: 5, vPadding: 0, hPadding: 5, isScrollable: true, showScrollIndicators: false) { movie in
                        
                        NavigationLink(destination: TVShowDetailsSwiftUIView(ShowID: movie.id)) {
                            TVShowCellSwiftUIView(movieObject: movie)
                        }
                       
                    }
                    Button(action: {
                        self.tvShowModel.pageIndex = self.tvShowModel.pageIndex + 1
                        self.tvShowModel.getTVShowList()
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
                self.tvShowModel.getTVShowList()
            }
           
        }
    }
}

struct TVShowListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowListSwiftUIView()
    }
}
