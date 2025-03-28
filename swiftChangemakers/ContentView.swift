//
//  ContentView.swift
//  swiftChangemakers
//
//  Created by Raymond Chavez on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Tabview().navigationBarBackButtonHidden(true)
        }
        
    }
}

struct Tabview: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            
            ForumsView()
                .tabItem {
                    Image(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")
                    Text("Forums")
                }
            
            UserView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("User")
                }
            
            
            
        }
    }
}

#Preview {
    ContentView()
}
