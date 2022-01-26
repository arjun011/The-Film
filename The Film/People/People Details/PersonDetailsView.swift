//
//  PersonDetailsView.swift
//  The Film
//
//  Created by Arjun on 25/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import MapKit
struct PersonDetailsView: View {
    var personID:Int?
    @StateObject private var model = PersonDetailsOO()
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            
        VStack(alignment: .leading, spacing: 10) {
            
                HStack(alignment: .center) {
                    WebImage(url: URL(string: self.getImageUrl(self.model.personDetail?.profile_path)))
                        .resizable()
                        .renderingMode(.original)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 170, height: 170, alignment: .center)
                        .shadow(radius: 5)
                        
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        
                        TitleSubTitleCellView(title: "Known for" , subTitle: self.model.personDetail?.known_for_department ?? "")
                        
                        TitleSubTitleCellView(title: "Gender" , subTitle: (self.model.personDetail?.gender ?? 1) == 1 ? "Female" : "Male")
                        
                        TitleSubTitleCellView(title: "Birthday" , subTitle: self.model.personDetail?.birthday ?? "")
                        
                        TitleSubTitleCellView(title: "Place of Birth" , subTitle: self.model.personDetail?.place_of_birth ?? "")
                            
                    }.font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                    
                }
                
                Text("Biography")
                    .font(.system(size: 18, weight: .bold))
                
                Text(self.model.personDetail?.biography ?? "")
                    .font(.system(size: 15, weight: .regular))
                
                
                Text("Known For")
                    .font(.system(size: 18, weight: .bold))
                
                
                HMovieListView(movieDataModelList: self.$model.personKnownFor)

        }.navigationTitle(self.model.personDetail?.name ?? "")
                
            
            Spacer()
        }.padding(.horizontal).onAppear {
            //self.model.getTestData()
            self.model.getPopularPeopleDetails(userID:self.personID ?? 224513)
        }
        
        
    }
    var getImageUrl:(String?) -> String = {
        return imageBaseUrl + "w342" + ($0 ?? "")
    }
    
    func checkDestination(cast: combined_creditsCastDataModel) -> Bool {
        if cast.media_type == "movie" {
            return true
            //return MovieDetailsSwiftUIView(movieID: cast.id)
        }else {
            return false
            //return TVShowDetailsSwiftUIView(ShowID: cast.id)
        }
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsView()
    }
}
