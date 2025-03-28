//
//  HomeView.swift
//  swiftChangemakers
//
//  Created by Alumno on 26/03/25.
//

import SwiftUI
import MapKit
import WeatherKit

struct HomeView: View {
    
    @StateObject var viewModel = NewsViewModel()
    @StateObject private var locationManager = LocationManager()
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Buenos días ☀️"
        case 12..<20:
            return "Buenas tardes 🌇"
        default:
            return "Buenas noches 🌙"
        }
    }
    
    var body: some View {
        /*HStack{
         HStack(alignment: .firstTextBaseline, spacing: 0.0){
         
         Text("Today").font(.largeTitle).fontWeight(.bold).padding(.horizontal, 5)
         
         Text(formattedDate  ).font(.subheadline).fontWeight(.medium).foregroundColor(.gray).bold()
         
         
         }
         Spacer()
         }.padding(16)
         */
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack {
                    
                    
                    /*DATOS GENERALES DEL DIA
                     HStack
                     {
                     Text("HORA 12HR")
                     Text("-")
                     Text("25 C°")
                     Text("-")
                     Text("Algo Mas")
                     }.padding(.top, 30)
                     */
                    
                    //MAPA
                    VStack(alignment: .leading){
                        Text(greeting)
                            .font(.title)
                            .padding(.top, 20).padding(.leading,30)
                        
                        NavigationView {
                            Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                                .edgesIgnoringSafeArea(.all).frame(width: 350, height: 350).cornerRadius(25)
                        }
                        
                    }
                    
                    
                    //LOLOLOLOLOLOLOLOL
                    //Text("LOLOLOLOLOLOLOLOLOL")
                    
                    
                    
                    //MENU CARRUSEL
                    ScrollView(.horizontal, showsIndicators: true)
                    {
                        
                        HStack{
                            
                            
                            VStack
                            {
                                Text("Hola")
                                
                            }.frame(width: 150, height: 150)
                                .background(Color(.pink).opacity(0.65))
                                .cornerRadius(25)
                            
                            
                            
                            VStack
                            {
                                Text("Hola")
                                
                            }.frame(width: 150, height: 150)
                                .background(Color(.orange))
                                .cornerRadius(25)
                            
                            
                            
                            
                            VStack
                            {
                                Text("Hola")
                                
                            }.frame(width: 150, height: 150)
                                .background(Color(.cyan))
                                .cornerRadius(25)
                            
                            
                            
                            VStack
                            {
                                Text("Hola")
                                
                            }.frame(width: 150, height: 150)
                                .background(Color(.purple))
                                .cornerRadius(25)
                            
                            
                            VStack
                            {
                                Text("Hola")
                                
                            }.frame(width: 150, height: 150)
                                .background(Color(.green))
                                .cornerRadius(25)
                            
                            
                            
                        }.multilineTextAlignment(.center)
                            .padding(.horizontal, 20).padding(.top, 20)
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                // Contenido de la vista de usuario
                
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("Today")
                            .font(.largeTitle)
                            .fontWeight(.bold).padding(.bottom, 40).padding(.top, 30)
                        Text(formattedDate)
                            .font(.subheadline)
                            .foregroundColor(Color.primary.opacity(0.6)).bold().padding(.bottom, 30).padding(.top, 30)
                    }
                }
            }
        }
    }
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: Date()).capitalized
    }
}

#Preview {
    HomeView()
}
