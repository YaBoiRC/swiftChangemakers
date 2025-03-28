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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
            
                VStack {
                    
                    
                    //DATOS GENERALES DEL DIA
                    HStack
                    {
                        Text("HORA 12HR")
                        Text("-")
                        Text("25 C°")
                        Text("-")
                        Text("Algo Mas")
                    }.padding(.top, 50)
                    
                    
                    //MAPA
                    Map().frame(width: 350, height: 350).cornerRadius(25)
                    
                    
                    //LOLOLOLOLOLOLOLOL
                    Text("LOLOLOLOLOLOLOLOLOL")
                    
                    
                    
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
                
            }
            .navigationTitle("Today (dia/mes/año)")
        }
    }
}

#Preview {
    HomeView()
}
