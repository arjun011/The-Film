//
//  MovieDetailsView.swift
//  The Film
//
//  Created by Arjun on 01/02/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct MovieDetailsView: View {
    var movieID:Int?
    @StateObject private var model = MovieDetailsOO()
    @State private var playTrailer = false
    
    
    var body: some View {
        
        ZStack{
            
            VStack(alignment: .center, spacing: 0) {
                
                ScrollView(.vertical, showsIndicators: true) {
                    WebImage(url: URL(string: self.getProfileImageUrl(self.model.movieDetails?.backdrop_path)))
                        .resizable()
                        .renderingMode(.original)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(0.8, contentMode: .fit)
                        .overlay {
                            
                            ZStack{
                                
                                Button {
                                    self.playTrailer.toggle()
                                } label: {
                                    Image(systemName: "play.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.pink)
                                }.shadow(radius: 5).sheet(isPresented: self.$playTrailer) {
                                    WebViewSwiftUIView(playUrl: self.model.movieDetails?.videos?.results.count ?? 0 > 0 ? self.model.movieDetails?.videos?.results[0].key : "")
                                }
                                
                                VStack(alignment: .center) {
                                    
                                    Spacer()
                                    
                                    LinearGradient(colors: [.black.opacity(0),
                                                            .black.opacity(0.5),
                                                            .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                                    
                                }
                            }
                        }
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        HStack(alignment: .center) {
                            
                            Spacer()
                            
                            Text(Helper.convertTimeTohourMinute(input: self.model.movieDetails?.runtime ?? 0))
                                .font(.system(size: 15, weight: .medium, design: .default))
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(self.model.movieDetails?.title ?? "")
                                .font(.system(size: 22, weight: .semibold))
                                .padding(.horizontal)
                            
                            Text(self.model.movieDetails?.overview ?? "")
                                .padding(.horizontal)
                            
                            
                            VStack(alignment: .leading, content: {
                                
                                Text("Cast")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: true) {
                                    
                                    LazyHStack(alignment: .center, spacing: 10) {
                                        ForEach(self.model.movieDetails?.credits?.cast ?? [castDataModel](), id: \.id) { cast in
                                            
                                            NavigationLink(destination: PersonDetailsView(personID: cast.id)) {
                                                MovieDetailCastSwiftUIView(cast: cast)
                                                
                                            }
                                        }
                                    }.padding(.horizontal)
                                    
                                }
                            })
                        }
                        
                    }.offset(y: -40)
                    
                }
                Spacer()
                
            }.onAppear {
                model.getMoviesDetails(movieID: movieID ?? 0)
                // model.getTestData()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .top)
        }
        
        
    }
    
    var getProfileImageUrl:(String?) -> String = {
        return imageBaseUrl + "original" + ($0 ?? "")
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}
