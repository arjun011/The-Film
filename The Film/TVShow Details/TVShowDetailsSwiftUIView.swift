//
//  TVShowDetailsSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct TVShowDetailsSwiftUIView: View {
   // @Environment(\.presentationMode) var presentationMode

    var ShowID:Int?
    @ObservedObject var model = TVShowDetailsModel()
    @State var playTrailer:Bool = false
    var body: some View {
        
        GeometryReader { gr in
            ZStack {
                WebImage(url: URL(string: self.getBackgroundImage(self.model.tvShowDetails?.backdrop_path)))
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: gr.size.width, alignment: .center)
                    .clipped()
                    .overlay(
                        Color.black.opacity(0.8)
                ).edgesIgnoringSafeArea(.all)
              //
                VStack(alignment: .leading, spacing: 2) {
                    
//                    Button(action: {
//                        // Back
//                      //  self.presentationMode.wrappedValue.dismiss()
//                          self.presentationMode.wrappedValue.dismiss()
//                    }) {
//                        HStack {
//                            Image(systemName: "chevron.left")
//                            Text("Home")
//                        }
//                        .font(.headline)
//                    }.padding([.leading, .bottom, .top], 10)
                    
                    TVShowDetailsHeaderSwiftUIView(tvShowDetails: self.model.tvShowDetails)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(alignment: .center , content: {
                                
                                HStack {
                                    VoteAverageCircleSwiftUIView(voteAverage: self.model.tvShowDetails?.vote_average ,circleFrame: (width: 35.0, height: 35.0))
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
                                WebViewSwiftUIView(playUrl: self.model.tvShowDetails?.videos?.results.count ?? 0 > 0 ? self.model.tvShowDetails?.videos?.results[0].key : "")
                            }
                            
                            // TVShow Overview
                            TVShowDetailsOverViewSwiftUIView(tvShowDetails:self.model.tvShowDetails)
                            
                            //TVShow Created by
                            TVShowDetailsCreatedbySwiftUIView(tvShowDetails:self.model.tvShowDetails)
                            
                            //TVShow seasons list
                            TVShowDetailsSeasonSwiftUIView(tvShowDetails:self.model.tvShowDetails)
                            
                            //TVShow Cast
                            VStack(alignment: .leading, content: {
                                Text("Cast")
                                    .font(.headline)
                                ScrollView(.horizontal, showsIndicators: true) {
                                    HStack(alignment: .center, spacing: 15, content: {
                                        ForEach(self.model.tvShowDetails?.credits?.cast ?? [castDataModel](), id: \.id) { cast in
                                            NavigationLink(destination: PopularPeopledetailsSwiftUIView(personID: cast.id)) {
                                                MovieDetailCastSwiftUIView(cast: cast)
                                            }
                                            
                                        }
                                    })
                                   
                                }
                            })
                            
                            
                          //  TVShowDetailsCastSwiftUIView(tvShowDetails: self.model.tvShowDetails)
                            
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
                        }
                    })
                
                    Spacer()
                }.foregroundColor(.white)
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal , 5)
                .navigationBarTitle("",displayMode: .inline)
                //.navigationBarHidden(true)
               // .navigationBarBackButtonHidden(true)
            }.onAppear {
                self.model.getTvShowDetails(showId: self.ShowID ?? 1)
            }
        }.overlay(
            self.model.tvShowDetails == nil ? LoadingSwiftUIView() : nil
        )

    }
    
    var getBackgroundImage: (String?) -> String  = {
         return imageBaseUrl + "original" + ($0 ?? "")
    }
}

struct TVShowDetailsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsSwiftUIView()
    }
}
