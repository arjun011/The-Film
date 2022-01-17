//
//  TVShowView.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI

struct TVShowView: View {
    
    @StateObject private var model = TVShowOO()
    @State var movieList = [MovieDataModel]()
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack(alignment: .center) {
                    Text("Popular")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Load more")
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HTVListView(TVDataModelList: $model.popularTVList)
                
                HStack(alignment: .center) {
                    
                    Text("Airing Today")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Load more")
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HTVListView(TVDataModelList: $model.airingTodayTVList)
                
                
                HStack(alignment: .center) {
                    
                    Text("On TV")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Load more")
                    }
                }.padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HTVListView(TVDataModelList: $model.onTVList)
                
                Group {
                    
                    HStack(alignment: .center) {
                        
                        Text("Top Rated")
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Load more")
                        }
                    }.padding(.horizontal)
                        .font(.system(size: 15, weight: .bold))
                    HTVListView(TVDataModelList: $model.topRatedTVList)
                }
                
                
            }.onAppear {
                debugPrint("Get Now laying")
               //self.model.retriveLatestTvList()
                
                self.model.retrivePopularTVList()
                self.model.retriveTvArrivingTodayList()
                self.model.retriveTvOnAirList()
                self.model.retriveTopRatedTVList()
               
               
            }
            
            
        }
    }
}

struct TVShowView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowView()
    }
}
