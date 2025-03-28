//
//  NewsView.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("Condición Climática")
                        .font(.title)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            // Widget de Clima
                            if let weather = viewModel.weather {
                                let celsius = weather.main.temp - 273.15
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Clima en Monterrey")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("Temp: \(String(format: "%.1f", celsius))°C")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    if let description = weather.weather.first?.description.capitalized {
                                        Text("Condición: \(description)")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding()
                                .frame(width: 250, height: 150)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.blue)
                                        .shadow(radius: 5)
                                )
                            } else {
                                // Estado de carga para clima
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 250, height: 150)
                                    .overlay(
                                        Text("Cargando clima...")
                                            .foregroundColor(.gray)
                                    )
                            }
                            
                            // Widget de Contaminación
                            if let pollution = viewModel.pollution {
                                let aqiValue = pollution.list.first?.main.aqi ?? 0
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Calidad del aire")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("AQI: \(aqiValue)")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    Text(aqiDescription(for: aqiValue))
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 250, height: 150)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(colorForAQI(aqiValue))
                                        .shadow(radius: 5)
                                )
                            } else {
                                // Estado de carga para contaminación
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 250, height: 150)
                                    .overlay(
                                        Text("Cargando contaminación...")
                                            .foregroundColor(.gray)
                                    )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Artículos recientes").font(.title)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    VStack(spacing:20){
                        
                    }
                    
                    Spacer()
                    
                }
            }
            .navigationTitle("News")
            .onAppear {
                viewModel.fetchData()
            }
            
            
                
        }
        
    
        
    }
    
    // Función auxiliar para obtener la descripción del AQI
    private func aqiDescription(for value: Int) -> String {
        switch value {
        case 1:
            return "Buena"
        case 2:
            return "Moderada"
        case 3:
            return "Pobre"
        case 4:
            return "Muy pobre"
        case 5:
            return "Extremadamente pobre"
        default:
            return "Desconocida"
        }
    }
    
    // Función que interpola un color entre verde (buena calidad) y rojo (mala calidad)
        private func colorForAQI(_ aqi: Int) -> Color {
            
            if aqi == 1 || aqi == 2 {
                return .green
            }
            if aqi == 3 || aqi == 4{
                return .orange
            }
            if aqi == 5{
                return .red
            }
            
            return .green
        }
    
}

#Preview {
    NewsView()
}
