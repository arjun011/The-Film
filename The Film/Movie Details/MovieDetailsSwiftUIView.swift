////
////  MovieDetailsSwiftUIView.swift

////
////  The Film
////  Created by Arjun C on 11/05/20.
////  Copyright © 2020 Arjun C. All rights reserved.
////
//
import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailsSwiftUIView: View {
    var movieID:Int?
    @State private var playTrailer:Bool = false
    @ObservedObject var model = MovieDetailsModel()
    init(movieID: Int?) {
         UITableView.appearance().separatorStyle = .none
        self.movieID = movieID
    }
    var body: some View {
        
        GeometryReader { gr in
            
            List{
                Section(header:
                    
                    MovieDetailsHeaderSwiftUIView(movieTime: self.model.movieTime, movieDetails: self.model.movieDetails)
                        
                        .background(Color.black)
                        .frame(width: gr.size.width)
                ) {
                    
                    HStack(alignment: .center , content: {
                        HStack {
                            VoteAverageCircleSwiftUIView(voteAverage: self.model.movieDetails?.vote_average ,circleFrame: (width: 35.0, height: 35.0))
                        }
                        Spacer()
                        Image(systemName: "list.bullet")
                        Spacer()
                        Image(systemName: "heart")
                        Spacer()
                        Image(systemName: "tag")
                        Spacer()
                        Image(systemName: "star")
                        Spacer()
                    }).padding()
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Button(action: {
                        self.playTrailer.toggle()
                    }) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Play Trailer")
                        }
                    }.sheet(isPresented: self.$playTrailer) {
                                                        WebViewSwiftUIView(playUrl: self.model.movieDetails?.videos?.results.count ?? 0 > 0 ? self.model.movieDetails?.videos?.results[0].key : "")
                    }
                    
                    // OverView of movie
                    MovieDetailsOverViewSwiftUIView(movieDetails: self.model.movieDetails)
                    
                    // Cast of Movie
                    MovieDetailCastSwiftUIView(movieDetails: self.model.movieDetails)
                    
                    // Recommendations Movies list
                    VStack(alignment: .leading, content: {
                        Text("Recommendations")
                            .font(.headline)
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(alignment: .center, spacing: 15, content: {
                                ForEach(self.model.movieDetails?.recommendations?.results ?? [MovieDataModel](), id: \.id) { movie in
                                    
                                    MovieDetailRecommendationsMovieListSwiftUIView(movie: movie)
                                        .onTapGesture {
                                            self.model.getMoviesDetails(movieID: movie.id ?? 1)
                                    }
                                    
                                }
                            })
                        }
                    })
                    
                }.listRowBackground(Color.black)
                    .navigationBarTitle(Text(self.model.movieDetails?.title ?? ""))
            }.foregroundColor(.white)
        }.onAppear {
            self.model.getMoviesDetails(movieID: self.movieID ?? 1)
        }
    }
    
    var getProfileImageUrl:(String?) -> String = {
        return imageBaseUrl + "h632" + ($0 ?? "")
    }
    var getMovieImageUrl:(MovieDataModel?) -> String = {
        return imageBaseUrl + "w342" + ($0?.poster_path ?? "")
    }
    
}


struct MovieDetailsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsSwiftUIView(movieID: 0)
    }
}
