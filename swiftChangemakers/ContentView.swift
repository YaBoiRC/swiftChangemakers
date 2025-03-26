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
            Tabview()
                        .navigationBarBackButtonHidden(true)
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
            
            UserView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("User")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
