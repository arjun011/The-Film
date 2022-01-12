//
//  TVShowView.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct TVShowView: View {
    
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
                        Text("Load more")
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HListView(movieDataModelList: $model.nowPlayingMovieList)
                
                HStack(alignment: .center) {
                    
                    Text("Poular")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Load more")
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HListView(movieDataModelList: $model.popularMovieList)
                
                
                HStack(alignment: .center) {
                    
                    Text("Top Rated")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Load more")
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HListView(movieDataModelList: $model.topRatedMovieList)
                
                Group {
                    
                    HStack(alignment: .center) {
                        
                        Text("Upcomming")
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Load more")
                        }
                    }.padding(.horizontal)
                        .font(.system(size: 15, weight: .bold))
                    HListView(movieDataModelList: $model.upCommingList)
                }
                
                
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

struct TVShowView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowView()
    }
}
