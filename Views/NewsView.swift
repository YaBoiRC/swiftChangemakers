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
            VStack(spacing: 20) {
                if let weather = viewModel.weather {
                    // Convertimos la temperatura de Kelvin a Celsius (aprox)
                    let celsius = weather.main.temp - 273.15
                    Text("Clima en Monterrey")
                        .font(.headline)
                    
                    Text("Temperatura: \(String(format: "%.1f", celsius))°C")
                        .font(.subheadline)
                    
                    // Tomamos la primera descripción disponible
                    if let description = weather.weather.first?.description.capitalized {
                        Text("Condición: \(description)")
                            .font(.subheadline)
                    }
                } else {
                    Text("Cargando información del clima...")
                        .foregroundColor(.gray)
                }
                
                Divider()
                
                if let pollution = viewModel.pollution {
                    // aqi es un índice de 1 a 5
                    let aqiValue = pollution.list.first?.main.aqi ?? 0
                    Text("Calidad del aire en Monterrey")
                        .font(.headline)
                    Text("AQI (Índice de calidad): \(aqiValue)")
                        .font(.subheadline)
                } else {
                    Text("Cargando información de contaminación...")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("News")
            .onAppear {
                // Cargamos ambos datos al aparecer la vista
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    NewsView()
}
