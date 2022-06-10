//
//  MovieDetailsView.swift
//  The Film
//
//  Created by Arjun on 01/02/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit
struct MovieDetailsView: View {
    var movieID:Int?
    @StateObject private var model = MovieDetailsOO()
    @State private var playTrailer = false
    
    // Animation variables
    @State var showOptions:Bool = false
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            VStack(alignment: .center, spacing: 0) {
                
                ScrollView(.vertical, showsIndicators: true) {
                    WebImage(url: URL(string: self.getProfileImageUrl(self.model.movieDetails?.poster_path)))
                        .resizable()
                        .renderingMode(.original)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(0.8, contentMode: .fit)
                        .overlay {
                            ZStack{
                                
                                VStack(alignment: .center) {
                                    
                                    HStack(alignment: .center) {
                                        
                                        Button {
                                            
                                        } label: {
                                            
                                            Image(systemName: "chevron.backward")
                                                .foregroundColor(.white)
                                                .font(.system(size: 30))
                                            
                                        }
                                        
                                        Spacer()
                                        
                                    }.background(.green)
                                    .padding(.vertical, 30)
                                    
                                    Spacer()
                                    LinearGradient(colors: [.black.opacity(0),
                                                            .black.opacity(0.5),
                                                            .black.opacity(0.8)], startPoint: .top, endPoint: .bottom).frame(height: 70, alignment: .center)
                                }.background(Color.red)
                                
                                
                                Button {
                                    self.playTrailer.toggle()
                                    print("Play Video")
                                } label: {
                                    Image(systemName: "play.circle.fill")
                                        .font(.title)
                                        .foregroundColor(.pink)
                                }.shadow(radius: 5).sheet(isPresented: self.$playTrailer) {
                                    WebViewSwiftUIView(playUrl: self.model.trailerID)
                                }
                            }
                        }
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        HStack(alignment: .center) {
                            
                            HStack(alignment: .center ,spacing: 18, content: {
                                
                                if !(self.model.movieDetails?.vote_average?.isZero ?? true) {
                                    VoteAverageCircleSwiftUIView(voteAverage: self.model.movieDetails?.vote_average ,circleFrame: (width: 32.0, height: 32.0))
                                        .layoutPriority(1)
                                }
                                
                                Image(systemName: "list.bullet")
                                
                                Image(systemName: "heart")
                                
                                Image(systemName: "tag")
                                
                                Image(systemName: "star")
                                
                            }).layoutPriority(1)
                                .foregroundColor(.white)
                                .font(.title2)
                            
                            Spacer()
                            
                            Text(Helper.convertTimeTohourMinute(input: self.model.movieDetails?.runtime ?? 0))
                                .font(.system(size: 15, weight: .medium, design: .default))
                                .foregroundColor(Color(.white))
                            
                        }.padding(.horizontal)
                            .offset(x: self.showOptions ? 0 : -350)
                            .opacity(self.showOptions ? 1 : 0.2)
                            .animation(.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3), value: self.showOptions)
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Group {
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text(self.model.movieDetails?.title ?? "").font(.system(size: 22, weight: .semibold))
                                    
                                    Text(self.model.movieDetails?.tagline ?? "")
                                        .font(.system(size: 17, weight: .medium))
                                        .foregroundColor(.gray)
                                }
                                
                                
                                HStack(alignment: .center, spacing: 5) {
                                    
                                    Text(Helper.convertDateFormat(inputDate: self.model.movieDetails?.release_date ?? ""))
                                    
                                    Text(self.model.movieDetails?.genres.map{$0.name ?? ""}.joined(separator: ", ") ?? "")
                                    
                                        .foregroundColor(.gray)
                                    
                                }.font(.system(size: 15, weight: .regular))
                                    .foregroundColor(.gray)
                                
                                
                                
                            }.padding(.horizontal)
                            
                            
                            Text(self.model.movieDetails?.overview ?? "")
                                .padding(.horizontal)
                            
                            
                            VStack(alignment: .leading, content: {
                                
                                //Cast List
                                CastHorizontalListView(castList: self.model.movieDetails?.credits?.cast ?? [castDataModel]())
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        
                                        HStack(alignment: .center, spacing: 5) {
                                            Text("Review")
                                            Image(systemName: "captions.bubble")
                                        }.padding()
                                        
                                        
                                    }.background(.ultraThinMaterial)
                                        .cornerRadius(10)
                                        .padding()
                                }
                                
                            })
                        }
                        
                    }.offset(y: -47)
                    
                }
                Spacer()
                    .navigationBarHidden(true)
            }.onAppear {
                model.getMoviesDetails(movieID: movieID ?? 338953)
                self.showOptions = true
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .ignoresSafeArea(edges: .top)
        
        
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
