//
//  PopularPeopledetailsSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 19/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct PopularPeopledetailsSwiftUIView: View {
    var personID:Int?
    @ObservedObject var model = PopularPeopleDetailsModel()
    var body: some View {
        GeometryReader { gr in
            ZStack{
                WebImage(url: URL(string: self.getImageUrl(self.model.personsDetail?.profile_path)))
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: gr.size.width, alignment: .center)
                    .scaledToFill()
                    .clipped()
                    .overlay(
                        Color.black.opacity(0.8)
                ).edgesIgnoringSafeArea(.all)
                    .navigationBarTitle(Text(self.model.personsDetail?.name ?? ""), displayMode: .inline)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Personal Info")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading, spacing: 9) {
                            Text("Known For")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text(self.model.personsDetail?.known_for_department ?? "")
                            Text("Gender")
                                .fontWeight(.bold)
                            Text((self.model.personsDetail?.gender ?? 1) == 1 ? "Female" : "Male")
                            Text("BirthDay")
                                .fontWeight(.bold)
                            Text(self.model.personsDetail?.birthday ?? "")
                            Text("Place of Birth")
                                .fontWeight(.bold)
                            Text(self.model.personsDetail?.place_of_birth ?? "")
                        }
                        
                        Text("Biography")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(self.model.personsDetail?.biography ?? "")
                        
                        Text("Known For")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .center, spacing: 5) {
                                ForEach(self.model.personsDetail?.combined_credits?.cast ?? [combined_creditsCastDataModel](), id: \.id) { cast in
                            
                                    
                                   
                                   //Todo issue: Ternary operator not working
                                    
                                  /*  NavigationLink(destination: self.checkDestination(cast: cast) ? MovieDetailsSwiftUIView(movieID: cast.id) : MovieDetailsSwiftUIView(movieID: cast.id)) {

                                        PopularPersonCastCellSwiftUIView(personCast: cast)

                                    } */
                                
                                        NavigationLink(destination: TVShowDetailsCastSwiftUIView(cast: cast)) {

                                            PopularPersonCastCellSwiftUIView(personCast: cast)

                                        }
                                    
                                }
                            }
                        }
                        
                        Spacer()
                    }.foregroundColor(.white)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                
                
                
            }
        }.onAppear {
            self.model.getPopularPeopleDetails(userID:self.personID ?? 1)
        }.overlay(
            self.model.personsDetail == nil ? LoadingSwiftUIView() : nil
        )

        
        
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

struct PopularPeopledetailsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPeopledetailsSwiftUIView()
    }
}
