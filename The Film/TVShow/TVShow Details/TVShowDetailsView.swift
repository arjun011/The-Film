//
//  TVShowDetailsView.swift
//  The Film
//
//  Created by Arjun on 27/05/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit
struct TVShowDetailsView: View {
    
    var tvShowID:Int?
    @StateObject private var model = TVShowDetailsOO()
    @State private var playTrailer:Bool = false
    
    var body: some View {
            
            VStack(alignment: .center, spacing: 0) {
                
                ScrollView(.vertical, showsIndicators: true) {
                    WebImage(url: URL(string: self.getBackgroundImage(self.model.tvShowDetails?.poster_path)))
                        .resizable()
                        .renderingMode(.original)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(0.8, contentMode: .fit)
                        .overlay {
                            ZStack{
                                VStack(alignment: .center) {

                                    Spacer()

                                    LinearGradient(colors: [.black.opacity(0),
                                                            .black.opacity(0.5),
                                                            .black.opacity(0.8)], startPoint: .top, endPoint: .bottom).frame(height: 70, alignment: .center)
                                }


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

                                if !(self.model.tvShowDetails?.vote_average?.isZero ?? true) {
                                    VoteAverageCircleSwiftUIView(voteAverage: self.model.tvShowDetails?.vote_average ,circleFrame: (width: 35.0, height: 35.0))
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
                            
                            
                            
                        }.padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            
                            TVShowDetailsHeaderSwiftUIView(tvShowDetails: self.model.tvShowDetails)
                            
                            // TVShow Overview
                            TVShowDetailsOverViewSwiftUIView(tvShowDetails:self.model.tvShowDetails)
                            
                            //TVShow Created by
                            TVShowDetailsCreatedbySwiftUIView(tvShowDetails:self.model.tvShowDetails)
                            
                            //TVShow seasons list
                            TVShowDetailsSeasonSwiftUIView(tvShowDetails:self.model.tvShowDetails)
                            
                            //TVShow Cast
                            CastHorizontalListView(castList: self.model.tvShowDetails?.credits?.cast ?? [castDataModel]())
                          
                            
                            // Recommendations TVShow list
                            VStack(alignment: .leading, content: {
                                Text("Recommendations")
                                    .font(.headline)
                                ScrollView(.horizontal, showsIndicators: true) {
                                    HStack(alignment: .center, spacing: 15, content: {
                                        
                                        ForEach(self.model.tvShowDetails?.similar?.results ?? [TVShowDataModel](), id: \.id) { tvShow in
                                            
                                            TVDetailsRecommendationShowSwiftUIView(tvShow: tvShow)
                                                
                                                .onTapGesture {
                                                self.model.getTvShowDetails(showId: tvShow.id ?? 1)
                                            }
                                        }
                                    })
                                }
                            })
                            

                            VStack(alignment: .leading, content: {
                                
                                
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
                    .padding(.horizontal)
                    
                }
                Spacer()
                
            }.onAppear {
                self.model.getTvShowDetails(showId: self.tvShowID ?? 1)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .top)
        
    }
    
    var getBackgroundImage: (String?) -> String  = {
         return imageBaseUrl + "original" + ($0 ?? "")
    }
}

struct TVShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsView(tvShowID: 1)
    }
}
