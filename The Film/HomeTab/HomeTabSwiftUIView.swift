//
//  HomeTabSwiftUIView.swift
//  The Film
//
//  Created by Arjun C on 05/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import SwiftUI
import UIKit

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}


struct HomeTabSwiftUIView: View {
    enum typesOfFim:String {
        case movies
        case tvShow
        case person
    }
    @State private var selectedPickerValue = typesOfFim.movies
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedPickerValue, label: Text("")) {
                    Text("Movies").tag(typesOfFim.movies)
                    Text("TV Shows").tag(typesOfFim.tvShow)
                    Text("Persons").tag(typesOfFim.person)
                }.pickerStyle(SegmentedPickerStyle())
                    .background(Color.gray)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                selectedSelctedView()
                
            }.background(Color.black)
                .navigationBarTitle("Home", displayMode: .automatic)
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = .black
                    nc.navigationBar.backgroundColor = .black
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    nc.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
                })
                .navigationBarHidden(true)
        }.accentColor(.white)
            
    }
    
    // Check selected segment and display view according that
    func selectedSelctedView() -> AnyView {
        switch selectedPickerValue {
        case .movies:
            return AnyView(MoviesListSwiftUIView())
        case .tvShow:
            return AnyView(TVShowListSwiftUIView())
        case .person:
            return AnyView(PersonsListSwiftUIView())
        }
    }
}

struct HomeTabSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabSwiftUIView()
    }
}


