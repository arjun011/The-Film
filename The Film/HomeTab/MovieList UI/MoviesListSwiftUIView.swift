//
//  MoviesListSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
//import QGrid
import SDWebImageSwiftUI
struct MoviesListSwiftUIView: View {
   @ObservedObject private var movieModel = MovieModel()
    var body: some View {
        ZStack {
            Color.black
            VStack {
                if movieModel.movieListArray?.results.count ?? 0 > 0 {
//                    QGrid(movieModel.movieListArray?.results ?? [MovieDataModel](), columns: 2, columnsInLandscape: 3, vSpacing: 5, hSpacing: 5, vPadding: 0, hPadding: 5, isScrollable: true, showScrollIndicators: false) { movie in
//                      
//                        
//                        NavigationLink(destination: MovieDetailsSwiftUIView(movieID: movie.id)) {
//                            MovieCellSwiftUIView(movieObject: movie)
//                        }
//                    }
                    Button(action: {
                        self.movieModel.pageIndex = self.movieModel.pageIndex + 1
                        self.movieModel.getMoviesList()
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
                self.movieModel.getMoviesList()
            }
           
        }
    }
    
    var getImageUrl:(MovieDataModel?) -> String = {
         print(imageBaseUrl + "w342" + ($0?.poster_path ?? ""))
         return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
     }
}

struct MoviesListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListSwiftUIView()
    }
}


