//
//  MovieView.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI
struct MovieView: View {
    
    @StateObject private var model = MovieOO()
    @State var movieList = [MovieDataModel]()
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack(alignment: .center) {
                    Text("Now Playing")
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.right")
                            .tint(.white)
                            
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HMovieListView(movieDataModelList: $model.nowPlayingMovieList)
                
                HStack(alignment: .center) {
                    
                    Text("Poular")
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.right")
                            .tint(.white)
                            
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HMovieListView(movieDataModelList: $model.popularMovieList)
                
                
                HStack(alignment: .center) {
                    
                    Text("Top Rated")
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.right")
                            .tint(.white)

                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HMovieListView(movieDataModelList: $model.topRatedMovieList)
                
                Group {
                    
                    HStack(alignment: .center) {
                        
                        Text("Upcomming")
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.right")
                                .tint(.white)

                        }
                    }.padding(.horizontal)
                        .font(.system(size: 15, weight: .bold))
                    
                    HMovieListView(movieDataModelList: $model.upCommingList)
                }
                .navigationBarTitleDisplayMode(.large)
                
            }.onAppear {
                debugPrint("Get Now laying")
                self.model.getNowPlayingMovie()
                self.model.getPopularMovie()
                self.model.getTopRatedMovie()
                self.model.getUpCommingMovie()
            }
            
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    
    static var move = [MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 63649, adult: true, backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Man: No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15"),
                       
        MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 634649, adult: true, backdrop_path: "/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg", original_language: "en", original_title: "Spider-Man:sd No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15")
                       
        ,MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 6649, adult: true, backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Mansdd: No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15"),
        
        MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 9, adult: true, backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Man: No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15"),
                       
                MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 64119, adult: true, backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Man: No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15"),
                       
            MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 6491, adult: true, backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Man: No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15"),
                       
                MovieDataModel(popularity: 1.2, vote_count: 23, video: true, poster_path: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", id: 464934, adult: true, backdrop_path: "/1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg", original_language: "en", original_title: "Spider-Man: No Way Home", title: "Spider-Man: No Way Home", vote_average: 9.4, overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15")]
    
    static var previews: some View {
       MovieView(movieList: move)
    }
}
