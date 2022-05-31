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
    
    // Animation Variables
    @State var showPersonDetails:Bool = false
    @State var showBioGraphyDetails:Bool = false
    @State var showBioGraphyTitle:Bool = false
    @State var showKnowFor:Bool = false
    @State var showProfilePic:Bool = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(alignment: .center) {
                    
                    VStack{
                        WebImage(url: URL(string: self.getImageUrl(self.model.personDetail?.profile_path)))
                            .resizable()
                            .renderingMode(.original)
                           
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 170, height: 170, alignment: .center)
                            .shadow(radius: 5)
                    }.opacity(self.showProfilePic ? 1 : 0)
                    .animation(.easeInOut(duration: 0.8).delay(0.5), value: self.showProfilePic)
                    
                    
                    if showPersonDetails {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            TitleSubTitleCellView(title: "Known for" , subTitle: self.model.personDetail?.known_for_department ?? "")
                            
                            TitleSubTitleCellView(title: "Gender" , subTitle: (self.model.personDetail?.gender ?? 1) == 1 ? "Female" : "Male")
                            
                            TitleSubTitleCellView(title: "Birthday" , subTitle: Helper.convertDateFormat(inputDate: self.model.personDetail?.birthday ?? ""))
                            
                            TitleSubTitleCellView(title: "Place of Birth" , subTitle: self.model.personDetail?.place_of_birth ?? "")
                            
                        }.font(.system(size: 20, weight: .bold))
                            .padding(.horizontal, 10)
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                        
                    }
                    
                    Spacer()
                    
                }
                
                if self.showBioGraphyTitle {
                    Text("Biography")
                        .font(.system(size: 18, weight: .bold))
                        .transition(.move(edge: .leading).combined(with: .opacity))
                }
                
                if self.showBioGraphyDetails {
                    Text(self.model.personDetail?.biography ?? "")
                        .font(.system(size: 15, weight: .regular))
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
            }.padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                
                // if self.showKnowFor {
                Text("Known For")
                    .font(.system(size: 18, weight: .bold))
                    .opacity(self.showKnowFor ? 1 : 0)
                    .animation(.easeInOut.delay(0.6), value: self.showKnowFor)
                    .padding([.horizontal])
                    .padding(.top, 10)
                
                HMovieListView(movieDataModelList: self.$model.personKnownFor)
                    .opacity(self.showKnowFor ? 1 : 0)
                    .animation(.easeInOut.delay(0.6), value: self.showKnowFor)
                //.transition(.move(edge: .trailing).combined(with: .opacity))
                // }
            }
            Spacer()
        }
        .navigationTitle(self.model.personDetail?.name ?? "")
        
        .onAppear {
            
            self.model.getPopularPeopleDetails(userID:self.personID ?? 224513)
            
            withAnimation(.easeInOut(duration: 0.6).delay(0.4)) {
                self.showPersonDetails = true
            }
            
            withAnimation(.easeInOut(duration: 0.6).delay(0.4)) {
                self.showBioGraphyDetails = true
            }
            
            withAnimation(.easeInOut(duration: 0.6).delay(0.6)) {
                self.showBioGraphyTitle = true
            }
            self.showKnowFor = true
            self.showProfilePic = true
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
